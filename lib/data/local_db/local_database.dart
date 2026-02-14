
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../db/message.dart';
import '../db/peer.dart';
import '../db/route.dart';
import '../db/queued_message.dart';
import '../db/session_key.dart';
import '../db/memory_fact.dart';
import '../db/contact.dart';

class LocalDatabase {
  static late Isar _isar;
  static final LocalDatabase _instance = LocalDatabase._();

  LocalDatabase._();

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [MessageSchema, PeerSchema, MeshRouteSchema, QueuedMessageSchema, SessionKeySchema, MemoryFactSchema, ContactSchema],
      directory: dir.path,
    );
  }

  static LocalDatabase get instance => _instance;
  Isar get isar => _isar;

  // Message Operations
  Future<void> saveMessage(Message msg) async {
    await _isar.writeTxn(() async {
      await _isar.messages.put(msg);
    });
  }

  Future<List<Message>> getChatHistory(String peerId) async {
    return await _isar.messages
        .filter()
        .senderIdEqualTo(peerId)
        .or()
        .receiverIdEqualTo(peerId)
        .sortByTimestamp()
        .findAll();
  }

  Future<void> markMessageAsDelivered(String messageId) async {
    final msg = await _isar.messages.filter().messageIdEqualTo(messageId).findFirst();
    if (msg != null) {
      msg.isDelivered = true;
      await _isar.writeTxn(() async {
        await _isar.messages.put(msg);
      });
    }
  }

  // Peer Operations
  Future<void> savePeer(Peer peer) async {
    await _isar.writeTxn(() async {
      await _isar.peers.put(peer);
    });
  }
  
  Future<List<Peer>> getAllPeers() async {
    return await _isar.peers.where().findAll();
  }

  // Contact Operations
  Future<void> saveContact(Contact contact) async {
    await _isar.writeTxn(() async {
      await _isar.contacts.put(contact);
    });
  }

  Future<List<Contact>> getAllContacts() async {
    return await _isar.contacts.where().findAll();
  }
  
  Future<Contact?> getContact(String peerId) async {
    return await _isar.contacts.filter().peerIdEqualTo(peerId).findFirst();
  }
}
