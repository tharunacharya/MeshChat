
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/local_db/local_database.dart';
import '../../data/db/message.dart';
import '../../data/db/peer.dart';

// Just a simple provider wrapper for now
final localDbProvider = Provider<LocalDatabase>((ref) {
  return LocalDatabase();
});

final chatHistoryProvider = FutureProvider.family<List<Message>, String>((ref, peerId) async {
  return await LocalDatabase.instance.getChatHistory(peerId);
});
