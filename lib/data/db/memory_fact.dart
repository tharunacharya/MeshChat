
import 'package:isar/isar.dart';

part 'memory_fact.g.dart';

@collection
class MemoryFact {
  Id id = Isar.autoIncrement;

  late String fact; // "User likes sushi"
  late String category; // "preference", "task", "general"
  late double confidence; // 0.0 to 1.0
  late String sourceMessageId; // Link to origin
  late int createdAt;
}
