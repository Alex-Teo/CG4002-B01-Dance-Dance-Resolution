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
  const D1HandDataStream = connection.collection("d1_raw_hand_datas").watch();
  const D2HandDataStream = connection.collection("d2_raw_hand_datas").watch();
  const D3HandDataStream = connection.collection("d3_raw_hand_datas").watch();
  const EmgDataStream = connection.collection("emg_datas").watch();
  const ProcessedDataStream = connection.collection("processed_datas").watch();
  const coachDataStream = connection.collection("coach_datas").watch();
  console.log(" MongoDB (Change Streams): Watching collections as streams");

  // ---------------- Emit on Change ---------------- //

  const sampling = 10;
  var a, b, c, d, e;
  a = b = c = d = e = 0;

  //Sockets for coach data  {actualDance:string, actualPositions:array}
  coachDataStream.on("change", (change) => {
    // console.log("New coach data");
    switch (change.operationType) {
      case "insert":
        const coachData = {
          actualDance: change.fullDocument.actualDance,
          actualPositions: change.fullDocument.actualPositions
            .split(" | ")
            .map((i) => Number(i)),
        };

        io.emit("newCoachData", coachData);
        console.log("Server emit coachData");
    }
  });

  // Sockets for raw data
  // {aX:num, aY:num, aZ:num, gX:num, gY:num, gZ:num}
  // No need to send over userid and tag

  let tempD1aX, tempD1aY, tempD1aZ, tempD1gX, tempD1gY, tempD1gZ;
  tempD1aX = tempD1aY = tempD1aZ = tempD1gX = tempD1gY = tempD1gZ = 0;

  D1HandDataStream.on("change", (change) => {
    switch (change.operationType) {
      case "insert":
        const RawData = {
          aX: change.fullDocument.aX,
          aY: change.fullDocument.aY,
          aZ: change.fullDocument.aZ,
          gX: change.fullDocument.gX,
          gY: change.fullDocument.gY,
          gZ: change.fullDocument.gZ,
        };

        // Get cumulative in a sample
        tempD1aX += Number(RawData.aX);
        tempD1aY += Number(RawData.aY);
        tempD1aZ += Number(RawData.aZ);
        tempD1gX += Number(RawData.gX);
        tempD1gY += Number(RawData.gY);
        tempD1gZ += Number(RawData.gZ);

        // Send ave data at a specified freq
        if (a % sampling == 0) {
          tempD1aX = tempD1aX / sampling;
          tempD1aY = tempD1aY / sampling;
          tempD1aZ = tempD1aZ / sampling;
          tempD1gX = tempD1gX / sampling;
          tempD1gY = tempD1gY / sampling;
          tempD1gZ = tempD1gZ / sampling;

          const FinalData = {
            aX: tempD1aX,
            aY: tempD1aY,
            aZ: tempD1aZ,
            gX: tempD1gX,
            gY: tempD1gY,
            gZ: tempD1gZ,
          };

          io.emit("newD1HandData", FinalData);
          tempD1aX = tempD1aY = tempD1aZ = tempD1gX = tempD1gY = tempD1gZ = 0;
          console.log(`Server emit d1data ${a}`);
        }

        a += 1;
    }
  });

  let tempD2aX, tempD2aY, tempD2aZ, tempD2gX, tempD2gY, tempD2gZ;
  tempD2aX = tempD2aY = tempD2aZ = tempD2gX = tempD2gY = tempD2gZ = 0;

  D2HandDataStream.on("change", (change) => {
    switch (change.operationType) {
      case "insert":
        const RawData = {
          aX: change.fullDocument.aX,
          aY: change.fullDocument.aY,
          aZ: change.fullDocument.aZ,
          gX: change.fullDocument.gX,
          gY: change.fullDocument.gY,
          gZ: change.fullDocument.gZ,
        };

        // Get cumulative in a sample
        tempD2aX += Number(RawData.aX);
        tempD2aY += Number(RawData.aY);
        tempD2aZ += Number(RawData.aZ);
        tempD2gX += Number(RawData.gX);
        tempD2gY += Number(RawData.gY);
        tempD2gZ += Number(RawData.gZ);

        // Send ave data at a specified freq
        if (b % sampling == 0) {
          tempD2aX = tempD2aX / sampling;
          tempD2aY = tempD2aY / sampling;
          tempD2aZ = tempD2aZ / sampling;
          tempD2gX = tempD2gX / sampling;
          tempD2gY = tempD2gY / sampling;
          tempD2gZ = tempD2gZ / sampling;

          const FinalData = {
            aX: tempD2aX,
            aY: tempD2aY,
            aZ: tempD2aZ,
            gX: tempD2gX,
            gY: tempD2gY,
            gZ: tempD2gZ,
          };

          io.emit("newD2HandData", FinalData);
          tempD2aX = tempD2aY = tempD2aZ = tempD2gX = tempD2gY = tempD2gZ = 0;
          console.log(`Server emit d2data ${b}`);
        }

        b += 1;
    }
  });

  let tempD3aX, tempD3aY, tempD3aZ, tempD3gX, tempD3gY, tempD3gZ;
  tempD3aX = tempD3aY = tempD3aZ = tempD3gX = tempD3gY = tempD3gZ = 0;

  D3HandDataStream.on("change", (change) => {
    switch (change.operationType) {
      case "insert":
        const RawData = {
          aX: change.fullDocument.aX,
          aY: change.fullDocument.aY,
          aZ: change.fullDocument.aZ,
          gX: change.fullDocument.gX,
          gY: change.fullDocument.gY,
          gZ: change.fullDocument.gZ,
        };

        // Get cumulative in a sample
        tempD3aX += Number(RawData.aX);
        tempD3aY += Number(RawData.aY);
        tempD3aZ += Number(RawData.aZ);
        tempD3gX += Number(RawData.gX);
        tempD3gY += Number(RawData.gY);
        tempD3gZ += Number(RawData.gZ);

        // Send ave data at a specified freq
        if (c % sampling == 0) {
          tempD3aX = tempD3aX / sampling;
          tempD3aY = tempD3aY / sampling;
          tempD3aZ = tempD3aZ / sampling;
          tempD3gX = tempD3gX / sampling;
          tempD3gY = tempD3gY / sampling;
          tempD3gZ = tempD3gZ / sampling;

          const FinalData = {
            aX: tempD1aX,
            aY: tempD1aY,
            aZ: tempD1aZ,
            gX: tempD1gX,
            gY: tempD1gY,
            gZ: tempD1gZ,
          };

          io.emit("newD3HandData", FinalData);
          tempD3aX = tempD3aY = tempD3aZ = tempD3gX = tempD3gY = tempD3gZ = 0;
          console.log(`Server emit d3data ${c}`);
        }

        c += 1;
    }
  });

  let tempD1Emg, tempD2Emg, tempD3Emg;
  tempD1Emg = tempD2Emg = tempD3Emg = 0;

  // Socket for emg data
  // {d1Emg:num, d2Emg:num, d3Emg:num}
  EmgDataStream.on("change", (change) => {
    switch (change.operationType) {
      case "insert":
        const EmgData = {
          d1Emg: change.fullDocument.d1Emg,
          d2Emg: change.fullDocument.d2Emg,
          d3Emg: change.fullDocument.d3Emg,
        };

        // Get cumulative in a sample
        tempD1Emg += Number(EmgData.d1Emg);
        tempD2Emg += Number(EmgData.d2Emg);
        tempD2Emg += Number(EmgData.d3Emg);

        // Send ave data at a specified freq
        if (d % sampling == 0) {
          tempD1Emg = tempD1Emg / sampling;
          tempD2Emg = tempD2Emg / sampling;
          tempD3Emg = tempD3Emg / sampling;

          const FinalData = {
            d1Emg: tempD1Emg,
            d2Emg: tempD2Emg,
            d3Emg: tempD3Emg,
          };

          io.emit("newEmgData", FinalData);
          tempD1Emg = tempD2Emg = tempD3Emg = 0;
          console.log(`Server emit emgdata ${d}`);
        }

        d += 1;
    }
  });

  // Sockets for processed data
  // {predictedDance:string, predictedPos:array}
  ProcessedDataStream.on("change", (change) => {
    switch (change.operationType) {
      case "insert":
        const ProcessedData = {
          predictedDance: change.fullDocument.predictedDance,
          predictedPos: change.fullDocument.predictedPos
            .split(" | ")
            .map((i) => Number(i)),
          syncDelay: Number(change.fullDocument.syncDelay),
        };

        io.emit("newProcessedData", ProcessedData);
        console.log("Server emit processeddata");
    }
  });
});

server.listen(PORT, () => console.log(`Server running on port ${PORT}`));
