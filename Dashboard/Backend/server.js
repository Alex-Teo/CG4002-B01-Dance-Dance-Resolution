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
// Imports for data and model
const rawDataDummy = require("./data/rawDataDummy");
const {
  processedDataDummy,
  coachDataDummy,
} = require("./data/processedDataDummy");

const RawDataModel = require("./models/RawDataModel");
const ProcessedDataModel = require("./models/ProcessedDataModel");
const CoachDataModel = require("./models/CoachDataModel");

// Fxn importData() used for testing -> importing of dummy data
const importData = async () => {
  try {
    const timer = (ms) => new Promise((res) => setTimeout(res, ms));
    div = processedDataDummy.length / coachDataDummy.length;
    let delay = 1000;

    // Clear exisiting collections
    await RawDataModel.deleteMany({});
    await ProcessedDataModel.deleteMany({});
    await CoachDataModel.deleteMany({});

    // Add in dummy data at 1000ms intervals
    for (var i = 0; i < coachDataDummy.length; i++) {
      await RawDataModel.insertMany(rawDataDummy[i]);
      await ProcessedDataModel.insertMany(processedDataDummy[i * div]);
      await CoachDataModel.insertMany(coachDataDummy[i]);
      await timer(delay);
    }
    console.log(" MongoDB: Dummy data imported");

    process.exit();
  } catch (error) {
    console.error(" MongoDB: Error with data import", error);
    process.exit(1);
  }
};

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

  await connection.dropCollection("processed_datas");
  await connection.dropCollection("raw_datas");
  await connection.dropCollection("coach_datas");
  console.log(" MongoDB: Deleted old collections");

  await connection.createCollection("processed_datas");
  await connection.createCollection("raw_datas");
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

  // Import dummy data
  importData();
});

// ---------------- Routing (old) ---------------- //
// const rawDataRoute = require("./routes/rawDataRoute");
// const processedDataRoute = require("./routes/processedDataRoute");

// app.use("/rawData", rawDataRoute);
// app.use("/processedData", processedDataRoute);

// ---------------- Server Start ---------------- //
server.listen(PORT, () => console.log(`Server running on port ${PORT}`));
