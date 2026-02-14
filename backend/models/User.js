const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema({
    peerId: { type: String, required: true, unique: true },
    alias: { type: String, unique: true, sparse: true, trim: true }, // Add Alias
    publicKey: { type: String }, // Base64 encoded x25519 public key
    fcmToken: { type: String },  // Firebase Cloud Messaging Token
    lastSeen: { type: Date, default: Date.now },
    isOnline: { type: Boolean, default: false }
});

module.exports = mongoose.model('User', UserSchema);
