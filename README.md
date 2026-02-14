# MeshTalk Global (MeshChat) 🌐

**A decentralized, offline-first chat application that seamlessly bridges Bluetooth Mesh and Cloud connectivity.**

MeshTalk Global is a privacy-focused messaging platform designed to work anywhere. It intelligently switches between a **local off-grid mesh network** (using Bluetooth Low Energy & WiFi Direct) and a **global cloud bridge** (when internet is available) to ensure your messages always get delivered.

---

## 🚀 Key Features

### 📡 Hybrid Connectivity
*   **Dual-Transport Routing Engine**: Automatically routes messages via the most efficient path (Mesh vs. Cloud).
*   **Offline First**: Chat without internet using peer-to-peer mesh networking.
*   **Store & Forward**: Messages are queued locally and synchronized when a connection is re-established.

### 🔒 Security & Privacy
*   **End-to-End Encryption**: Messages are secured using AES-GCM encryption.
*   **Decentralized Identity**: Users are identified by unique cryptographic Peer IDs (UUIDs).
*   **User Aliases**: Map your complex UUID to a human-readable alias (e.g., `@tharun`).

### ✨ Modern UI/UX
*   **Glassmorphism Design**: stunning UI with blur effects, gradients, and fluid animations.
*   **Adaptive Theme**: seamless switching between **Dark Mode** (Premium Dark) and **Light Mode** (Liquid Glass).
*   **Interactive Profiles**: Manage your identity, copy your ID, and check connection status.

### 🧠 AI Integration
*   **Smart Replies**: Context-aware reply suggestions powered by Google Gemini.
*   **Personal Memory**: The app learns from your conversations to assist you better (stored locally).

---

## 🛠️ Tech Stack

### Frontend (Mobile App)
*   **Framework**: [Flutter](https://flutter.dev/) (Dart)
*   **State Management**: Riverpod
*   **Local Database**: Isar (NoSQL)
*   **Networking**: `flutter_p2p_connection`, `socket_io_client`, `http`

### Backend (Cloud Bridge)
*   **Runtime**: Node.js
*   **Framework**: Express.js
*   **Real-time**: Socket.IO
*   **Database**: MongoDB (Mongoose)

---

## 🏁 Getting Started

### Prerequisites
*   [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x+)
*   [Node.js](https://nodejs.org/) (v16+)
*   [MongoDB](https://www.mongodb.com/try/download/community) (Local or Atlas)
*   Android Device/Emulator or iOS Simulator

### 1. Backend Setup
The backend handles the Cloud Bridge and Alias resolution.

```bash
# Navigate to backend directory
cd backend

# Install dependencies
npm install

# Create .env file
echo "PORT=3000" > .env
echo "MONGO_URI=mongodb://localhost:27017/meshtalk" >> .env

# Start the server
node server.js
```

### 2. Frontend Setup (Flutter)
The mobile application.

```bash
# Navigate to root directory
cd .. 

# Install dependencies
flutter pub get

# Run the app
# Ensure an emulator or device is connected
flutter run
```

---

## 📖 Usage Guide

1.  **Onboarding**: The app automatically generates a **Peer ID** for you on first launch.
2.  **Profile**: Go to the Profile screen to set your **Display Name** and register a unique **Alias** (e.g., `@username`).
3.  **New Chat**: Tap the "+" button and enter a friend's **Peer ID** or **Alias**.
4.  **Communication**:
    *   If you are close to the peer (and they are on the same WiFi/BLE range), messages go **Directly** (Status: *Sent via Mesh*).
    *   If you are far apart, messages route via the **Cloud Bridge** (Status: *Sent via Cloud*).

---

## 🤝 Contributing

Contributions are welcome!
1.  Fork the repository.
2.  Create a feature branch (`git checkout -b feature/amazing-feature`).
3.  Commit your changes (`git commit -m 'Add amazing feature'`).
4.  Push to the branch (`git push origin feature/amazing-feature`).
5.  Open a Pull Request.

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.
