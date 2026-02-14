
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'data/local_db/local_database.dart';
import 'features/discovery/discovery_screen.dart';
import 'features/chat/chat_screen.dart';
import 'features/chat/chat_screen.dart';
import 'features/ai_assistant/memory_screen.dart';
import 'features/profile/profile_screen.dart';
import 'core/theme/app_theme.dart';
import 'core/encryption/security_service.dart';
import 'core/cloud/cloud_service.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'core/preferences/user_preferences.dart';
import 'features/onboarding/onboarding_screen.dart'; // Will create this next
import 'features/chat/chat_list_screen.dart'; // Will create this next

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Request permissions
  await [
    Permission.location,
    Permission.storage,
    Permission.bluetooth,
    Permission.bluetoothScan,
    Permission.bluetoothConnect,
    Permission.bluetoothAdvertise,
    Permission.nearbyWifiDevices,
  ].request();

  await LocalDatabase.init();
  await UserPreferences().init();

  // Initialize Security & Cloud
  final security = SecurityService();
  await security.init();
  final pubKeyBytes = await security.getPublicKey();
  final pubKeyBase64 = base64Encode(pubKeyBytes);
  
  final myPeerId = UserPreferences().peerId;
  
  print("🚀 Starting MeshTalk Global");
  print("🆔 My Peer ID: $myPeerId");
  print("👤 Username: ${UserPreferences().username ?? 'Not Set'}");
  
  CloudService().init(myPeerId, pubKeyBase64);

  runApp(const ProviderScope(child: MeshTalkApp()));
}

final _router = GoRouter(
  initialLocation: UserPreferences().username == null ? '/onboarding' : '/chats', // Use Chats as Home
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/chats',
      builder: (context, state) => const ChatListScreen(), // New Home
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const DiscoveryScreen(),
    ),
    GoRoute(
      path: '/memory',
      builder: (context, state) => const MemoryScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/chat/:peerId',
      builder: (context, state) {
        final peerId = state.pathParameters['peerId']!;
        final name = state.uri.queryParameters['name'] ?? "Unknown";
        return ChatScreen(peerId: peerId, peerName: name);
      },
    ),
  ],
);

class MeshTalkApp extends StatelessWidget {
  const MeshTalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MeshTalk X',
      theme: AppTheme.lightTheme, // Default to Light
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, // Enforce Light Mode for Liquid Glass look
      routerConfig: _router,
    );
  }
}
