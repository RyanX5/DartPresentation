const express = require('express');
const http = require('http');
const { Server } = require('socket.io');
const path = require('path');

const app = express();
const server = http.createServer(app);
const io = new Server(server);

// Frame counts per slide index (22 slides total):
// [cover, s01-intro, s02-background, s03-domains, s04-conditionals, s05-iteration,
//  s06-operators, s07-types, s08-primitives, s09-generics, s10-functions,
//  s11-lambdas, s12-advanced, s13-classes, s14-inheritance, s15-interfaces,
//  s16-encapsulation, s17-concurrency, s18-compilation, s19-demo, s20-conclusion, thankyou]
const FRAME_COUNTS = [1, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1];

let state = { slide: 0, frame: 0 };

// Serve the Flutter web build
app.use(express.static(path.join(__dirname, '../build/web')));

// Serve the remote control page
app.get('/remote', (req, res) => {
  res.sendFile(path.join(__dirname, 'remote.html'));
});

io.on('connection', (socket) => {
  console.log(`Client connected: ${socket.id}`);

  // Immediately sync the new client to current state
  socket.emit('stateUpdate', state);

  socket.on('next', () => {
    const maxFrames = FRAME_COUNTS[state.slide];
    if (state.frame < maxFrames - 1) {
      state.frame++;
    } else if (state.slide < FRAME_COUNTS.length - 1) {
      state.slide++;
      state.frame = 0;
    }
    // Already at last slide last frame — do nothing
    io.emit('stateUpdate', state);
  });

  socket.on('previous', () => {
    if (state.frame > 0) {
      state.frame--;
    } else if (state.slide > 0) {
      state.slide--;
      state.frame = FRAME_COUNTS[state.slide] - 1;
    }
    // Already at slide 0 frame 0 — do nothing
    io.emit('stateUpdate', state);
  });

  socket.on('reset', () => {
    state = { slide: 0, frame: 0 };
    io.emit('stateUpdate', state);
  });

  socket.on('disconnect', () => {
    console.log(`Client disconnected: ${socket.id}`);
  });
});

const PORT = 3000;
server.listen(PORT, () => {
  console.log(`\nDart Presentation Server running on port ${PORT}`);
  console.log(`  Presentation:    http://localhost:${PORT}`);
  console.log(`  Remote control:  http://localhost:${PORT}/remote\n`);
});
