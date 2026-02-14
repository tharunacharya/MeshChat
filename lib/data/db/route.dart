
import 'package:isar/isar.dart';

part 'route.g.dart';

@collection
class MeshRoute {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String destinationId; // The peer we want to reach

  late String nextHopId; // The direct neighbor to send to
  
  late int hopCount; // Distance
  
  late int timestamp; // For route freshness
}
