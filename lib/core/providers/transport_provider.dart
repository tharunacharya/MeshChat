
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../transport/wifi_direct_service.dart';
import '../transport/transport_interface.dart';
import '../cloud/cloud_service.dart';
import '../routing/routing_engine.dart';
import '../routing/routing_table_service.dart';
import '../routing/store_and_forward_service.dart';

final wifiServiceProvider = Provider<WifiDirectService>((ref) {
  return WifiDirectService();
});

final discoveredPeersProvider = StreamProvider<List<DiscoveredPeer>>((ref) {
  final service = ref.watch(wifiServiceProvider);
  return service.discoveredPeers;
});

final incomingPacketProvider = StreamProvider<dynamic>((ref) {
  final service = ref.watch(wifiServiceProvider);
  return service.incomingData;
});

final cloudServiceProvider = Provider<CloudService>((ref) {
  return CloudService();
});

final routingTableProvider = Provider<RoutingTableService>((ref) {
  return RoutingTableService();
});

final routingEngineProvider = Provider<RoutingEngine>((ref) {
  final transport = ref.watch(wifiServiceProvider);
  final routingTable = ref.watch(routingTableProvider);
  final cloudService = ref.watch(cloudServiceProvider);
  return RoutingEngine(transport, routingTable, cloudService);
});
