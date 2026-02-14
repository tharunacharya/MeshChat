
import 'package:isar/isar.dart';

part 'message.g.dart';

@collection
class Message {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String messageId;

  late String senderId;
  late String receiverId;
  late String content; // Encrypted or plain text
  late int timestamp;
  
  bool isSent = false;
  bool isDelivered = false;
  bool isEncrypted = false;
}
