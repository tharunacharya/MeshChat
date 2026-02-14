
import 'package:isar/isar.dart';
import 'dart:convert';
import '../../data/local_db/local_database.dart';
import '../../data/db/queued_message.dart';
import '../protocols/mesh_packet.dart';
import '../../core/transport/transport_interface.dart';
import '../../core/routing/routing_table_service.dart';

class StoreAndForwardService {
  final Isar _isar = LocalDatabase.instance.isar;
  final RoutingTableService _routingTable;
  final TransportInterface _transport;

  StoreAndForwardService(this._routingTable, this._transport);

  Future<void> queuePacket(MeshPacket packet) async {
    final queued = QueuedMessage()
      ..packetJson = jsonEncode(packet.toJson())
      ..receiverId = packet.receiverId
      ..timestamp = DateTime.now().millisecondsSinceEpoch;
    
    await _isar.writeTxn(() async {
      await _isar.queuedMessages.put(queued);
    });
    print("Packet queued for ${packet.receiverId}");
  }

  // Attempt to flush queue for a specific peer that just came online
  Future<void> processQueueForPeer(String peerId) async {
      // Find messages meant for this peer OR messages that can be routed via this peer
      // Simplified: Just iterate all and check if route exists now
      
      final allQueued = await _isar.queuedMessages.where().findAll();
      
      for (var q in allQueued) {
         final nextHop = await _routingTable.getNextHop(q.receiverId);
         if (nextHop == peerId) { // If this new peer IS the next hop
            try {
               await _transport.sendData(peerId, utf8.encode(q.packetJson));
               await _isar.writeTxn(() async {
                 await _isar.queuedMessages.delete(q.id);
               });
               print("Flushed queued message to $peerId for final dest ${q.receiverId}");
            } catch (e) {
               print("Failed to flush: $e");
            }
         }
      }
  }
}
