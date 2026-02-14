require('dotenv').config();
const express = require('express');
const http = require('http');
const { Server } = require('socket.io');
const mongoose = require('mongoose');
const cors = require('cors');
const Message = require('./models/Message');
const User = require('./models/User');

const app = express();
const server = http.createServer(app);
const io = new Server(server, {
    cors: {
        origin: "*",
        methods: ["GET", "POST"]
    }
});

app.use(cors());
app.use(express.json());

// MongoDB Connection
mongoose.connect(process.env.MONGO_URI || 'mongodb://localhost:27017/meshtalk')
    .then(() => console.log('✅ MongoDB Connected'))
    .catch(err => console.error('❌ MongoDB Connection Error:', err));

// Socket.io Logic
const connectedUsers = new Map(); // peerId -> socketId

io.on('connection', (socket) => {
    console.log(`🔌 New connection: ${socket.id}`);

    // Device Registration
    socket.on('register', async (data) => {
        // data: { peerId: "uuid", publicKey: "base64", fcmToken: "optional" }
        if (data && data.peerId) {
            connectedUsers.set(data.peerId, socket.id);
            socket.join(data.peerId); // Join a room with their own Peer ID
            console.log(`📱 Device Registered: ${data.peerId}`);

            // Update User in DB
            try {
                await User.findOneAndUpdate(
                    { peerId: data.peerId },
                    {
                        publicKey: data.publicKey,
                        fcmToken: data.fcmToken,
                        lastSeen: new Date(),
                        isOnline: true
                    },
                    { upsert: true, new: true }
                );

                // Check for pending messages
                const pendingMessages = await Message.find({ receiverId: data.peerId, status: 'pending' });
                if (pendingMessages.length > 0) {
                    console.log(`📨 Found ${pendingMessages.length} pending messages for ${data.peerId}`);
                    for (const msg of pendingMessages) {
                        socket.emit('message', msg.packet);
                        // Mark as delivered
                        msg.status = 'delivered';
                        await msg.save();
                    }
                }
            } catch (e) {
                console.error('Registration/Sync Error:', e);
            }
        }
    });

    // Message Relay
    socket.on('message', async (packet) => {
        // packet: MeshPacket JSON
        console.log(`📩 Relay Request: ${packet.senderId} -> ${packet.receiverId}`);

        const receiverId = packet.receiverId;

        // Check if receiver is online
        if (connectedUsers.has(receiverId)) {
            // Deliver immediately
            io.to(receiverId).emit('message', packet);
            console.log(`🚀 Delivered to ${receiverId}`);

            // Send Ack to Sender
            socket.emit('ack', {
                messageId: packet.messageId,
                status: 'delivered',
                receiverId: receiverId
            });
        } else {
            // Store for later
            console.log(`⚠️ User ${receiverId} offline. Queuing message in MongoDB.`);
            try {
                const newMessage = new Message({
                    messageId: packet.messageId,
                    senderId: packet.senderId,
                    receiverId: packet.receiverId,
                    timestamp: packet.timestamp || Date.now(),
                    packet: packet,
                    status: 'pending'
                });
                await newMessage.save();
                console.log(`💾 Message saved to DB`);

                // Send Ack to Sender (Sent to Cloud)
                socket.emit('ack', {
                    messageId: packet.messageId,
                    status: 'sent',
                    receiverId: receiverId
                });
            } catch (e) {
                console.error('Message Save Error:', e);
            }
        }
    });

    socket.on('disconnect', async () => {
        // Remove user
        for (const [peerId, socketId] of connectedUsers.entries()) {
            if (socketId === socket.id) {
                connectedUsers.delete(peerId);
                console.log(`❌ Device Disconnected: ${peerId}`);
                // Update DB
                try {
                    await User.findOneAndUpdate(
                        { peerId: peerId },
                        { isOnline: false, lastSeen: new Date() }
                    );
                } catch (e) {
                    console.error('Disconnect DB update error:', e);
                }
                break;
            }
        }
    });
});

// ALIAS ENDPOINTS
app.post('/api/set-alias', async (req, res) => {
    const { peerId, alias } = req.body;
    if (!peerId || !alias) return res.status(400).json({ error: 'Missing peerId or alias' });

    try {
        // Check if alias is taken
        const existing = await User.findOne({ alias });
        if (existing && existing.peerId !== peerId) {
            return res.status(409).json({ error: 'Alias already taken' });
        }

        const user = await User.findOneAndUpdate(
            { peerId },
            { alias },
            { new: true, upsert: true }
        );
        console.log(`🏷️ Alias set: ${alias} -> ${peerId}`);
        res.json({ success: true, alias: user.alias });
    } catch (e) {
        console.error('Set Alias Error:', e);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

app.get('/api/resolve-alias/:alias', async (req, res) => {
    const { alias } = req.params;
    try {
        const user = await User.findOne({ alias });
        if (!user) return res.status(404).json({ error: 'Alias not found' });
        res.json({ peerId: user.peerId, publicKey: user.publicKey });
    } catch (e) {
        console.error('Resolve Alias Error:', e);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

app.get('/', (req, res) => {
    res.send('MeshTalk Cloud Bridge is Running 🚀');
});

const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
    console.log(`🌍 Server running on port ${PORT}`);
});
