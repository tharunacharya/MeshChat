
import 'package:cryptography/cryptography.dart';
import 'package:isar/isar.dart';
import '../../data/local_db/local_database.dart';
import '../../data/db/session_key.dart';
import 'dart:convert';
import 'dart:typed_data';

class SecurityService {
  final Isar _isar = LocalDatabase.instance.isar;
  final _algorithm = X25519();
  final _cipher = AesGcm.with256bits();
  
  // Singleton access if needed, or Provider
  static final SecurityService _instance = SecurityService._();
  factory SecurityService() => _instance;
  SecurityService._();

  SimpleKeyPair? _myKeyPair;

  Future<void> init() async {
    // Generate our keypair if we haven't already
    // For MVP, regenerating on restart (Session keys would need to be re-exchanged)
    // In production, store private key in SecureStorage
    _myKeyPair ??= await _algorithm.newKeyPair();
  }

  Future<List<int>> getPublicKey() async {
    if (_myKeyPair == null) await init();
    final pk = await _myKeyPair!.extractPublicKey();
    return pk.bytes;
  }

  // Derive and store shared secret from peer's public key
  Future<void> establishSession(String peerId, List<int> peerPublicKeyBytes) async {
    if (_myKeyPair == null) await init();
    
    final peerPublicKey = SimplePublicKey(
      peerPublicKeyBytes,
      type: KeyPairType.x25519,
    );

    final sharedSecret = await _algorithm.sharedSecretKey(
      keyPair: _myKeyPair!,
      remotePublicKey: peerPublicKey,
    );

    final keyBytes = await sharedSecret.extractBytes();

    final session = SessionKey()
      ..peerId = peerId
      ..sharedSecret = keyBytes
      ..createdAt = DateTime.now().millisecondsSinceEpoch;

    await _isar.writeTxn(() async {
      await _isar.sessionKeys.put(session);
    });
    
    print("Session established with $peerId");
  }

  Future<List<int>> encrypt(String peerId, String plaintext) async {
    final session = await _isar.sessionKeys.filter().peerIdEqualTo(peerId).findFirst();
    if (session == null) {
      throw Exception("No session key for $peerId");
    }

    final secretKey = SecretKey(session.sharedSecret);
    final nonce = _cipher.newNonce(); // Random nonce
    
    final box = await _cipher.encrypt(
      utf8.encode(plaintext),
      secretKey: secretKey,
      nonce: nonce,
    );

    // Format: nonce + ciphertext + mac (mac is usually included in Concatenation in dart cryptography, 
    // but AesGcm.encrypt returns SecretBox).
    // Let's manually serialize: nonce(12) + ciphertext + mac(16)
    
    final mac = box.mac.bytes;
    final cipherText = box.cipherText;
    
    // Simple concat
    return [...nonce, ...mac, ...cipherText];
  }

  Future<String> decrypt(String peerId, List<int> encryptedData) async {
    final session = await _isar.sessionKeys.filter().peerIdEqualTo(peerId).findFirst();
    if (session == null) {
      throw Exception("No session key for $peerId");
    }

    // Extract parts. AES-GCM nonce is 12 bytes. Mac is 16 bytes.
    if (encryptedData.length < 28) throw Exception("Invalid data length");

    final nonce = encryptedData.sublist(0, 12);
    final macBytes = encryptedData.sublist(12, 28);
    final cipherText = encryptedData.sublist(28);

    final secretKey = SecretKey(session.sharedSecret);
    
    final box = SecretBox(
      cipherText,
      nonce: nonce,
      mac: Mac(macBytes),
    );

    final decrypted = await _cipher.decrypt(
      box,
      secretKey: secretKey,
    );

    return utf8.decode(decrypted);
  }
}
