
import 'dart:async';

enum TransportType { ble, wifi, combined }

class DiscoveredPeer {
  final String id;
  final String deviceName;
  final TransportType type;
  final String? connectionAddress; // Mac address or IP

  DiscoveredPeer({
    required this.id,
    required this.deviceName,
    required this.type,
    this.connectionAddress,
  });
}

abstract class TransportInterface {
  Stream<List<DiscoveredPeer>> get discoveredPeers;
  Stream<dynamic> get incomingData; // Raw data stream

  Future<void> startDiscovery();
  Future<void> stopDiscovery();
  Future<void> connect(DiscoveredPeer peer);
  Future<void> disconnect(String peerId);
  Future<void> sendData(String peerId, List<int> data);
  Future<void> dispose();
}
