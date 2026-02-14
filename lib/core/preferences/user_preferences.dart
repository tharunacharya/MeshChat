import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class UserPreferences {
  static const String _keyPeerId = 'peer_id';
  static const String _keyUsername = 'username';
  
  static final UserPreferences _instance = UserPreferences._internal();
  factory UserPreferences() => _instance;
  UserPreferences._internal();

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    
    // Auto-generate Peer ID if missing
    if (!_prefs.containsKey(_keyPeerId)) {
       final newId = const Uuid().v4();
       await _prefs.setString(_keyPeerId, newId);
    }
  }

  String get peerId => _prefs.getString(_keyPeerId) ?? "UNKNOWN_ID";
  
  String? get username => _prefs.getString(_keyUsername);
  
  Future<void> setUsername(String name) async {
    await _prefs.setString(_keyUsername, name);
  }

  static const String _keyAlias = 'alias';
  String? get alias => _prefs.getString(_keyAlias);
  Future<void> setAlias(String alias) async {
    await _prefs.setString(_keyAlias, alias);
  }
}
