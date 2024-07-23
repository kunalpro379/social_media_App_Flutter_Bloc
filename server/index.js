const express = require('express');
const http = require('http');
const socketIo = require('socket.io');
const { v4: uuidv4 } = require('uuid');
const NodeMediaServer = require('node-media-server');

const app = express();
const server = http.createServer(app);
const io = socketIo(server);

const PORT = process.env.PORT || 3000;
const rooms = new Map(); // Store room information

// Serve static files (optional)
app.use(express.static('public'));

// Handle socket.io connections
io.on('connection', (socket) => {
    console.log('New client connected:', socket.id);

    // Create a room with a specific roomId
    socket.on('createRoom', (roomId) => {
        if (!rooms.has(roomId)) {
            rooms.set(roomId, new Set());
            startStreaming(roomId); // Start streaming when room is created
            socket.emit('roomCreated', roomId); // Notify client that room is created
        }
        socket.join(roomId);
        rooms.get(roomId).add(socket.id);
        console.log(`Client ${socket.id} created/joined room ${roomId}`);
        socket.emit('roomJoined', roomId);
    });

    // Join a room with a specific roomId
    socket.on('joinRoom', (roomId) => {
        if (rooms.has(roomId)) {
            socket.join(roomId);
            rooms.get(roomId).add(socket.id);
            console.log(`Client ${socket.id} joined room ${roomId}`);
            socket.emit('roomJoined', roomId);
        } else {
            socket.emit('roomNotFound');
        }
    });

    // Handle WebRTC signaling
    socket.on('offer', (data) => {
        socket.to(data.roomId).emit('offer', data.sdp);
    });

    socket.on('answer', (data) => {
        socket.to(data.roomId).emit('answer', data.sdp);
    });

    socket.on('iceCandidate', (data) => {
        socket.to(data.roomId).emit('iceCandidate', data.candidate);
    });

    // Handle chat messages
    socket.on('chatMessage', (data) => {
        io.to(data.roomId).emit('chatMessage', {
            id: socket.id,
            message: data.message
        });
    });

    // Handle disconnect
    socket.on('disconnect', () => {
        console.log('Client disconnected:', socket.id);
        rooms.forEach((clients, roomId) => {
            if (clients.has(socket.id)) {
                clients.delete(socket.id);
                if (clients.size === 0) {
                    rooms.delete(roomId);
                }
            }
        });
    });
});

// Setup NodeMediaServer (for media streaming)
const config = {
    rtmp: {
        port: 1935,
        chunk_size: 60000,
        gop_cache: true,
        ping: 60,
        ping_timeout: 30
    },
    http: {
        port: 8000,
        mediaroot: './media',
        allow_origin: '*'
    }
};

const nms = new NodeMediaServer(config);
nms.run();

// Function to start streaming for a room
function startStreaming(roomId) {
    // Implement your streaming logic here (e.g., using NodeMediaServer API)
    // For demonstration purposes, assume we are starting a live stream for the room
    console.log(`Streaming started for room ${roomId}`);
    // Example: nms.startLiveStream({ streamKey: roomId });
}

// Start server
server.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}`);
});
