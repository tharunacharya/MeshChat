import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:async';
import '../protocols/mesh_packet.dart';
import '../../data/local_db/local_database.dart';
import '../../features/discovery/discovery_screen.dart'; // For now just to get Providers or similar? Actually better to be standalone.

import '../../features/onboarding/onboarding_screen.dart'; // Just for docs references
import '../../core/preferences/user_preferences.dart';

class CloudService {
  late IO.Socket _socket;
  final String _serverUrl;
  bool _isConnected = false;
  
  final StreamController<MeshPacket> _cloudDataController = StreamController.broadcast();
  Stream<MeshPacket> get cloudDataStream => _cloudDataController.stream;

  // Singleton
  static final CloudService _instance = CloudService._internal();
  factory CloudService() => _instance;
  CloudService._internal() : _serverUrl = _determineUrl();

  static String _determineUrl() {
    if (kDebugMode && defaultTargetPlatform == TargetPlatform.android) {
      return 'http://10.0.2.2:3000'; // Emulator loopback
    }
    return 'http://localhost:3000'; // iOS Simulator / Web
  }

  void init(String peerId, String publicKey) {
    if (_isConnected) return;

    _socket = IO.io(_serverUrl, IO.OptionBuilder()
        .setTransports(['websocket'])
        .disableAutoConnect() 
        .build());

    _socket.connect();

    _socket.onConnect((_) {
      print('☁️ Connected to Cloud Bridge');
      _isConnected = true;
      
      // Register Device
      _socket.emit('register', {
        'peerId': peerId,
        'publicKey': publicKey,
        'username': UserPreferences().username, // Sync Name
        // 'fcmToken': ... // TODO
      });
    });

    _socket.onDisconnect((_) {
      print('☁️ Disconnected from Cloud');
      _isConnected = false;
    });

    _socket.on('message', (data) {
      print('☁️ Received Cloud Message: $data');
      try {
        // data is likely a Map if socket.io parsed it, or string
        final packet = MeshPacket.fromJson(data);
        _cloudDataController.add(packet);
      } catch (e) {
        print('Error parsing cloud packet: $e');
      }
    });


    
    _socket.on('ack', (data) {
        // data: { messageId, status, receiverId }
        print('✅ Received Ack: $data');
        if (data['status'] == 'delivered') {
           LocalDatabase.instance.markMessageAsDelivered(data['messageId']);
        }
    });

    _socket.connect();
  }

  void sendMessage(MeshPacket packet) {
    if (!_isConnected) {
      print('❌ Cannot send to cloud: Disconnected');
      // TODO: Queue locally? Or let StoreAndForward handle that?
      return;
    }
    _socket.emit('message', packet.toJson());
  }
  
  bool get isConnected => _isConnected;

  // --- ALIAS API ---
  Future<bool> setAlias(String alias) async {
    try {
      final response = await http.post(
        Uri.parse('$_serverUrl/api/set-alias'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'peerId': UserPreferences().peerId,
          'alias': alias
        })
      );
      
      if (response.statusCode == 200) {
        await UserPreferences().setAlias(alias);
        return true;
      } else {
        print('Failed to set alias: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Set Alias Error: $e');
      return false;
    }
  }

  Future<Map<String, String>?> resolveAlias(String alias) async {
    try {
      final response = await http.get(Uri.parse('$_serverUrl/api/resolve-alias/$alias'));
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'peerId': data['peerId'],
          'publicKey': data['publicKey'] ?? '' // Optional
        };
      }
      return null;
    } catch (e) {
      print('Resolve Alias Error: $e');
      return null;
    }
  }
}
