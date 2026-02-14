const mongoose = require('mongoose');

const MessageSchema = new mongoose.Schema({
    messageId: { type: String, required: true, unique: true },
    senderId: { type: String, required: true },
    receiverId: { type: String, required: true },
    timestamp: { type: Number, required: true },

    // The full MeshPacket payload (encrypted)
    packet: { type: Object, required: true },

    status: {
        type: String,
        enum: ['pending', 'delivered'],
        default: 'pending'
    },
    createdAt: { type: Date, default: Date.now }
});

module.exports = mongoose.model('Message', MessageSchema);
