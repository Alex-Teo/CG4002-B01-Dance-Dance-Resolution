require("dotenv").config();

const cors = require("cors");
const express = require("express");
const mongoose = require("mongoose");

// ---------------- Server Setup ---------------- //
const app = express();
const server = require("http").createServer(app);
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

// ---------------- Socket.io Setup ---------------- //
// Init server side socket
const io = require("socket.io")(server, {
  cors: {
    origin: ["http://localhost:3000"],
    methods: ["GET", "POST"],
  },
});

// Function runs everytime a client connects to the server
io.on("connection", (socket) => {
  console.log(
    "Socket.io: Client-server connection established, ID -",
    socket.id
  );
});

// ---------------- MongoDB Setup ---------------- //

// Connect to MongoDB Atlas
mongoose.connect(process.env.MONGO_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});
const connection = mongoose.connection;
connection.on(
  "error",
  console.error.bind(console, "MongoDB: Connection error: ")
);

// Reset MongoDB Collections
connection.once("open", async () => {
  console.log("MongoDB: Connected");

  await connection.dropCollection("d1_raw_hand_datas");
  await connection.dropCollection("d2_raw_hand_datas");
  await connection.dropCollection("d3_raw_hand_datas");
  await connection.dropCollection("d1_raw_chest_datas");
  await connection.dropCollection("d2_raw_chest_datas");
  await connection.dropCollection("d3_raw_chest_datas");
  await connection.dropCollection("emg_datas");
  await connection.dropCollection("processed_datas");
  await connection.dropCollection("coach_datas");
  console.log(" MongoDB: Deleted old collections");

  await connection.createCollection("d1_raw_hand_datas");
  await connection.createCollection("d2_raw_hand_datas");
  await connection.createCollection("d3_raw_hand_datas");
  await connection.createCollection("d1_raw_chest_datas");
  await connection.createCollection("d2_raw_chest_datas");
  await connection.createCollection("d3_raw_chest_datas");
  await connection.createCollection("emg_datas");
  await connection.createCollection("processed_datas");
  await connection.createCollection("coach_datas");
  console.log(" MongoDB: Creating fresh collections");

  // Setup change streams
  const RawDataStream = connection.collection("raw_datas").watch();
  const ProcessedDataStream = connection.collection("processed_datas").watch();
  const coachDataStream = connection.collection("coach_datas").watch();
  console.log(" MongoDB (Change Streams): Watching collections as streams");

  // ---------------- Emit on Change ---------------- //

  //Sockets for coach data
  coachDataStream.on("change", (change) => {
    // console.log("New coach data");
    switch (change.operationType) {
      case "insert":
        const coachData = {
          actualDance: change.fullDocument.actualDance,
          actualPositions: change.fullDocument.actualPositions,
          dancer1Feedback: change.fullDocument.dancer1Feedback,
          dancer2Feedback: change.fullDocument.dancer2Feedback,
          dancer3Feedback: change.fullDocument.dancer3Feedback,
        };
        io.emit("newCoachData", coachData);
    }
  });

  // Sockets for raw data
  RawDataStream.on("change", (change) => {
    // console.log("New raw data");
    switch (change.operationType) {
      case "insert":
        const RawData = {
          userID: change.fullDocument.userID,
          aX: change.fullDocument.aX,
          aY: change.fullDocument.aY,
          aZ: change.fullDocument.aZ,
          gX: change.fullDocument.gX,
          gY: change.fullDocument.gY,
          gZ: change.fullDocument.gZ,
          emg: change.fullDocument.emg,
        };
        io.emit("newRawData", RawData);
    }
  });

  // Sockets for processed data
  ProcessedDataStream.on("change", (change) => {
    // console.log("New processed data");
    switch (change.operationType) {
      case "insert":
        const ProcessedData = {
          predictedDance: change.fullDocument.predictedDance,
          predictedPos: change.fullDocument.predictedPos,
          syncDelay: change.fullDocument.syncDelay,
        };

        io.emit("newProcessedData", ProcessedData);
    }
  });
});

server.listen(PORT, () => console.log(`Server running on port ${PORT}`));
