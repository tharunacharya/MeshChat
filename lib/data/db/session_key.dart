
import 'package:isar/isar.dart';

part 'session_key.g.dart';

@collection
class SessionKey {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String peerId; // The remote peer this key is for

  late List<byte> sharedSecret; // The derived shared key
  late int createdAt;
}
