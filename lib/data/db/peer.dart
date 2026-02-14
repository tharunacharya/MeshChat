
import 'package:isar/isar.dart';

part 'peer.g.dart';

@collection
class Peer {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String peerId;

  late String deviceName;
  late String? connectionAddress;
  bool isOnline = false;
  late int lastSeen;
}
