import 'package:isar/isar.dart';

part 'contact.g.dart';

@collection
class Contact {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String peerId;

  late String name;
  
  late DateTime lastSeen;
  
  bool isBlocked = false;
}
