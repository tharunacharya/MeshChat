
import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'transport_interface.dart';

class BleDiscoveryService {
  final StreamController<List<DiscoveredPeer>> _peersController = StreamController.broadcast();
  Stream<List<DiscoveredPeer>> get discoveredPeers => _peersController.stream;

  bool _isScanning = false;
  final List<DiscoveredPeer> _foundPeers = [];

  Future<void> startScan() async {
    if (_isScanning) return;
    
    // Check permissions
    if (await Permission.bluetoothScan.request().isGranted &&
        await Permission.bluetoothConnect.request().isGranted &&
        await Permission.location.request().isGranted) {
        
        _isScanning = true;
        _foundPeers.clear();

        FlutterBluePlus.scanResults.listen((results) {
          for (ScanResult r in results) {
            String name = r.device.platformName;
            if (name.isEmpty) name = r.advertisementData.localName;
            if (name.isEmpty) name = "Unknown Device";

            // Filter logic: Only show devices that look like MeshTalk peers (custom logic later)
            // For MVP, showing all to ensure visibility
            
            final peer = DiscoveredPeer(
              id: r.device.remoteId.str,
              deviceName: name,
              type: TransportType.ble,
            );

            if (!_foundPeers.any((p) => p.id == peer.id)) {
                _foundPeers.add(peer);
                _peersController.add(List.from(_foundPeers));
            }
          }
        });

        await FlutterBluePlus.startScan(timeout: const Duration(seconds: 15));
    }
  }

  Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
    _isScanning = false;
  }
}
