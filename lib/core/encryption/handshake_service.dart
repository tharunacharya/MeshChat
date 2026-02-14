
import 'dart:convert';
import 'security_service.dart';
import '../transport/transport_interface.dart';
import '../protocols/mesh_packet.dart';
import '../../data/local_db/local_database.dart';
import 'package:isar/isar.dart';

class HandshakeService {
  final TransportInterface _transport;
  final SecurityService _security = SecurityService();
  final String myDeviceId = "ME"; // TODO: Real ID

  HandshakeService(this._transport);

  // Step 1: Send our Public Key
  Future<void> initiateHandshake(String peerId) async {
    final pk = await _security.getPublicKey();
    final pkBase64 = base64Encode(pk);
    
    final packet = MeshPacket.create(
      type: PacketType.chat, // Using chat type for MVP, but dedicated type better. 
      // Actually let's use a special payload marker for handshake
      senderId: myDeviceId,
      receiverId: peerId,
      payload: {
        'type': 'HANDSHAKE_INIT',
        'key': pkBase64,
      },
    );

    // Send directly or via routing (handshake usually needs direct or route)
    // For MVP assuming direct or routed.
    // We send via transport directly if neighbor, or need routing engine.
    // For now, let's assume we use transport sendData directly if neighbor.
    // But HandshakeService should probably use RoutingEngine to send?
    // Let's stick to transport for direct peers for now.
    
    final packetJson = jsonEncode(packet.toJson());
    await _transport.sendData(peerId, utf8.encode(packetJson));
    print("Sent Handshake INIT to $peerId");
  }


  Future<void> handleHandshakePacket(MeshPacket packet) async {
     final type = packet.payload['type'];
     if (type == 'HANDSHAKE_INIT') {
        final peerKey = base64Decode(packet.payload['key']);
        await _security.establishSession(packet.senderId, peerKey);
        
        // Send back our key (Handshake RESPONSE)
        final myPk = await _security.getPublicKey();
        final response = MeshPacket.create(
           type: PacketType.chat,
           senderId: myDeviceId,
           receiverId: packet.senderId,
           payload: {
             'type': 'HANDSHAKE_RESP',
             'key': base64Encode(myPk),
           }
        );
        await _transport.sendData(packet.senderId, utf8.encode(jsonEncode(response.toJson())));
        print("Responded to Handshake from ${packet.senderId}");
     } else if (type == 'HANDSHAKE_RESP') {
        final peerKey = base64Decode(packet.payload['key']);
        await _security.establishSession(packet.senderId, peerKey);
        print("Handshake COMPLETED with ${packet.senderId}");
     }
  }
}
