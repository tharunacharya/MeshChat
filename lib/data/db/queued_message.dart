
import 'package:isar/isar.dart';
import '../../core/protocols/mesh_packet.dart';

part 'queued_message.g.dart';

@collection
class QueuedMessage {
  Id id = Isar.autoIncrement;

  late String packetJson; // Serialized MeshPacket
  late String receiverId;
  late int timestamp;
  int retryCount = 0;
}
