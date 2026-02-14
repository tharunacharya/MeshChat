
import 'dart:convert';
import '../protocols/mesh_packet.dart';
import '../transport/transport_interface.dart';
import '../transport/wifi_direct_service.dart';
import 'routing_table_service.dart';
import '../../data/local_db/local_database.dart';
import '../../data/db/message.dart';
import '../../data/db/contact.dart';

import '../cloud/cloud_service.dart';
import '../../features/ai_assistant/ai_memory_service.dart';

class RoutingEngine {
  final TransportInterface _transport;
  final RoutingTableService _routingTable;
  final CloudService _cloudService;
  final String myDeviceId = "ME"; // TODO: Get real ID

  RoutingEngine(this._transport, this._routingTable, this._cloudService) {
    _init();
  }

  void _init() {
    _transport.incomingData.listen((data) {
      handleIncomingPacket(data);
    });
    
    _cloudService.cloudDataStream.listen((packet) {
      print("☁️ Received packet from Cloud");
      // Cloud packets are already MeshPacket objects (or close to it)
      // If we need to treat them as "incoming data", we can handle here.
      // But handleIncomingPacket expects JSON string usually? 
      // Let's overload or separate logic.
      _handleCloudPacket(packet);
    });
  }

  Future<void> sendPacket(MeshPacket packet) async {
     await _forwardPacket(packet);
  }

  void _handleCloudPacket(MeshPacket packet) {
      // Logic same as handleIncoming, but skip JSON decode
      if (packet.receiverId == myDeviceId) {
        _deliverLocally(packet);
      } else {
        _forwardPacket(packet);
      }
  }

  Future<void> handleIncomingPacket(dynamic data) async {
    try {
      if (data is! String) return; // Only handling JSON string packets
      final json = jsonDecode(data);
      final packet = MeshPacket.fromJson(json);

      print("Received packet ${packet.messageId} for ${packet.receiverId}");

      if (packet.receiverId == myDeviceId) {
        _deliverLocally(packet);
      } else {
        await _forwardPacket(packet);
      }
      
      // If it's a ROUTE packet, update our table
      if (packet.type == PacketType.route) {
         _handleRouteUpdate(packet);
      }

    } catch (e) {
      print("Routing error: $e");
    }
  }

  void _deliverLocally(MeshPacket packet) async {
    // Save to DB as received
    if (packet.type == PacketType.chat) {
      final msg = Message()
        ..messageId = packet.messageId
        ..senderId = packet.senderId
        ..receiverId = myDeviceId
        ..content = packet.payload['text']
        ..timestamp = packet.timestamp
        ..isDelivered = true;
      
      await LocalDatabase.instance.saveMessage(msg);
      print("Message delivered locally: ${msg.content}");
      
      // Update Contact
      final contact = Contact()
        ..peerId = packet.senderId
        ..name = "Peer ${packet.senderId.substring(0, 4)}" // Default name until we have better sync
        ..lastSeen = DateTime.now();
        
      // TODO: Logic to not overwrite name if we already have a better one
      // For now, simple upsert or check existence
      final existing = await LocalDatabase.instance.getContact(packet.senderId);
      if (existing != null) {
         contact.id = existing.id;
         contact.name = existing.name; // Keep existing name
      }
      await LocalDatabase.instance.saveContact(contact);
      
      // AI Analysis
      AiMemoryService().analyzeMessage(msg);
    }
  }

  Future<void> _forwardPacket(MeshPacket packet) async {
    if (packet.hopCount >= packet.maxHops) {
      print("Packet dropped: Max hops exceeded");
      return;
    }

    final nextHop = await _routingTable.getNextHop(packet.receiverId);
    
    if (nextHop != null) {
      print("Forwarding packet to $nextHop for destination ${packet.receiverId}");
      // Create new packet with incremented hop
      final forwarded = MeshPacket(
        messageId: packet.messageId,
        type: packet.type,
        senderId: packet.senderId,
        receiverId: packet.receiverId,
        hopCount: packet.hopCount + 1,
        maxHops: packet.maxHops,
        timestamp: packet.timestamp,
        payload: packet.payload,
      );
      
      await _transport.sendData(nextHop, utf8.encode(jsonEncode(forwarded.toJson())));
    } else {
      print("No mesh route to ${packet.receiverId}. Checking Cloud Bridge...");
      
      if (_cloudService.isConnected) {
        print("☁️ Sending to Cloud Bridge for global delivery");
        _cloudService.sendMessage(packet);
      } else {
        print("Cloud disconnected. Queueing for Store-and-Forward.");
         // TODO: Implement Store-and-Forward Queue (already partially managed by StoreAndForwardService)
      }
    }
  }

  void _handleRouteUpdate(MeshPacket packet) {
     // Payload should contain list of routes: [{'dest': 'A', 'cost': 1}, ...]
     final routes = packet.payload['routes'] as List;
     for (var r in routes) {
       // if peer says "I can reach X in 1 hop", and I received this from Peer,
       // then I can reach X in 1 + 1 = 2 hops via Peer.
       final dest = r['dest'];
       final cost = r['cost'] + 1;
       _routingTable.updateRoute(dest, packet.senderId, cost);
     }
  }
}
