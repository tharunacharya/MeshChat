
import 'dart:convert';
import 'package:uuid/uuid.dart';

enum PacketType { chat, ack, route, memory }

class MeshPacket {
  final String messageId;
  final PacketType type;
  final String senderId;
  final String receiverId;
  final int hopCount;
  final int maxHops;
  final int timestamp;
  final Map<String, dynamic> payload;

  MeshPacket({
    required this.messageId,
    required this.type,
    required this.senderId,
    required this.receiverId,
    this.hopCount = 0,
    this.maxHops = 5,
    required this.timestamp,
    required this.payload,
  });

  factory MeshPacket.create({
    required PacketType type,
    required String senderId,
    required String receiverId,
    required Map<String, dynamic> payload,
    int maxHops = 5,
  }) {
    return MeshPacket(
      messageId: const Uuid().v4(),
      type: type,
      senderId: senderId,
      receiverId: receiverId,
      timestamp: DateTime.now().millisecondsSinceEpoch,
      payload: payload,
      maxHops: maxHops,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messageId': messageId,
      'type': type.toString().split('.').last.toUpperCase(),
      'senderId': senderId,
      'receiverId': receiverId,
      'hopCount': hopCount,
      'maxHops': maxHops,
      'timestamp': timestamp,
      'payload': payload,
    };
  }

  factory MeshPacket.fromJson(Map<String, dynamic> json) {
    return MeshPacket(
      messageId: json['messageId'] as String,
      type: PacketType.values.firstWhere(
        (e) => e.toString().split('.').last.toUpperCase() == json['type'],
        orElse: () => PacketType.chat,
      ),
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      hopCount: json['hopCount'] as int? ?? 0,
      maxHops: json['maxHops'] as int? ?? 5,
      timestamp: json['timestamp'] as int,
      payload: json['payload'] as Map<String, dynamic>,
    );
  }
}
