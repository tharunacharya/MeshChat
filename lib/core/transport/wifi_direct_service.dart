
import 'dart:async';
import 'dart:convert';
import 'package:flutter_p2p_connection/flutter_p2p_connection.dart';
import 'transport_interface.dart';
import '../protocols/mesh_packet.dart';

class WifiDirectService implements TransportInterface {
  final _flutterP2pConnectionPlugin = FlutterP2pConnection();
  final StreamController<List<DiscoveredPeer>> _peersController = StreamController.broadcast();
  final StreamController<dynamic> _incomingDataController = StreamController.broadcast();

  final List<DiscoveredPeer> _peers = [];
  bool _initialized = false;
  WifiP2PInfo? _wifiP2PInfo;

  @override
  Stream<List<DiscoveredPeer>> get discoveredPeers => _peersController.stream;

  @override
  Stream<dynamic> get incomingData => _incomingDataController.stream;

  Future<void> init() async {
    if (_initialized) return;
    await _flutterP2pConnectionPlugin.initialize();
    await _flutterP2pConnectionPlugin.register();
    
    // Listen to connection changes
    _flutterP2pConnectionPlugin.streamWifiP2PInfo().listen((info) {
      _wifiP2PInfo = info;
    });

    // Listen to peers
    _flutterP2pConnectionPlugin.streamPeers().listen((peers) {
      _peers.clear();
      for (var p in peers) {
        _peers.add(DiscoveredPeer(
          id: p.deviceAddress,
          deviceName: p.deviceName,
          type: TransportType.wifi,
          connectionAddress: p.deviceAddress,
        ));
      }
      _peersController.add(List.from(_peers));
    });

    _initialized = true;
  }

  @override
  Future<void> startDiscovery() async {
    if (!_initialized) await init();
    bool started = await _flutterP2pConnectionPlugin.discover();
    if (!started) {
      print("Failed to start WiFi Direct discovery");
    }
  }

  @override
  Future<void> stopDiscovery() async {
    await _flutterP2pConnectionPlugin.stopDiscovery();
  }

  @override
  Future<void> connect(DiscoveredPeer peer) async {
    await _flutterP2pConnectionPlugin.connect(peer.connectionAddress!);
  }

  @override
  Future<void> disconnect(String peerId) async {
    await _flutterP2pConnectionPlugin.removeGroup();
  }

  Future<void> startSocket() async {
    if (_wifiP2PInfo != null && _wifiP2PInfo!.isGroupOwner) {
      await _flutterP2pConnectionPlugin.startSocket(
        groupOwnerAddress: _wifiP2PInfo!.groupOwnerAddress,
        downloadPath: "/storage/emulated/0/Download/", // TODO: use path_provider
        maxConcurrentDownloads: 2,
        deleteOnError: true,
        onConnect: (name, address) {
          print("$name connected to socket: $address");
        },
        transferUpdate: (transfer) {},
        receiveString: (req) {
          // req is the received string
          // We decode it to get the MeshPacket
           _incomingDataController.add(req);
        },
      );
    } else if (_wifiP2PInfo != null && !_wifiP2PInfo!.isGroupOwner) {
       await _flutterP2pConnectionPlugin.connectToSocket(
        groupOwnerAddress: _wifiP2PInfo!.groupOwnerAddress,
        downloadPath: "/storage/emulated/0/Download/",
        maxConcurrentDownloads: 2,
        deleteOnError: true,
        onConnect: (address) {
           print("Connected to host socket: $address");
        },
        transferUpdate: (transfer) {},
        receiveString: (req) {
           _incomingDataController.add(req);
        },
      );
    }
  }

  @override
  Future<void> sendData(String peerId, List<int> data) async {
    // The plugin sends strings mainly for simple data, or files
    // Use sendStringToSocket for JSON packets
    String payload = utf8.decode(data);
    _flutterP2pConnectionPlugin.sendStringToSocket(payload);
  }
  
  @override
  Future<void> dispose() async {
    await _flutterP2pConnectionPlugin.removeGroup();
    await _flutterP2pConnectionPlugin.unregister();
  }
}
