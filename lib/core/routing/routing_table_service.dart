
import 'package:isar/isar.dart';
import '../../data/db/route.dart';
import '../../data/local_db/local_database.dart';

class RoutingTableService {
  final Isar _isar = LocalDatabase.instance.isar;

  // Update or Add a route
  Future<void> updateRoute(String destinationId, String nextHopId, int cost) async {
    final existing = await _isar.meshRoutes.filter().destinationIdEqualTo(destinationId).findFirst();
    
    // Only update if new route is better (shorter hops) or significantly fresher
    if (existing == null || cost < existing.hopCount) {
       final route = MeshRoute()
         ..destinationId = destinationId
         ..nextHopId = nextHopId
         ..hopCount = cost
         ..timestamp = DateTime.now().millisecondsSinceEpoch;
       
       await _isar.writeTxn(() async {
         await _isar.meshRoutes.put(route);
       });
       print("Updated route to $destinationId via $nextHopId (cost: $cost)");
    }
  }

  // Get next hop for a destination
  Future<String?> getNextHop(String destinationId) async {
    final route = await _isar.meshRoutes.filter().destinationIdEqualTo(destinationId).findFirst();
    return route?.nextHopId;
  }
  
  // Get all routes to share with a new peer
  Future<List<MeshRoute>> getAllRoutes() async {
    return await _isar.meshRoutes.where().findAll();
  }
}
