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
  // Client socket requests
  socket.on("CLIENT_LOGOUT", function () {
    console.log("Manual logout request received!");
  });
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
  await connection.dropCollection("emg_datas");
  await connection.dropCollection("processed_datas");
  await connection.dropCollection("coach_datas");
  console.log(" MongoDB: Deleted old collections");

  await connection.createCollection("d1_raw_hand_datas");
  await connection.createCollection("d2_raw_hand_datas");
  await connection.createCollection("d3_raw_hand_datas");
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
  const CoachDataStream = connection.collection("coach_datas").watch();

  console.log(" MongoDB (Change Streams): Watching collections as streams");

  // ---------------- Emit on Change ---------------- //
  // Constants
  const samplingRaw = 1;
  const samplingProcessed = 1;

  var counter_1, counter_2, counter_3, counter_4, counter_5;
  counter_1 = counter_2 = counter_3 = counter_4 = counter_5 = 0;

  var tempD1aX, tempD1aY, tempD1aZ, tempD1gX, tempD1gY, tempD1gZ;
  tempD1aX = tempD1aY = tempD1aZ = tempD1gX = tempD1gY = tempD1gZ = 0;

  var tempD2aX, tempD2aY, tempD2aZ, tempD2gX, tempD2gY, tempD2gZ;
  tempD2aX = tempD2aY = tempD2aZ = tempD2gX = tempD2gY = tempD2gZ = 0;

  var tempD3aX, tempD3aY, tempD3aZ, tempD3gX, tempD3gY, tempD3gZ;
  tempD3aX = tempD3aY = tempD3aZ = tempD3gX = tempD3gY = tempD3gZ = 0;

  var tempEmgMean = 0;

  var overallEmgData = [];
  var overallDancer1Data = [];
  var overallDancer2Data = [];
  var overallDancer3Data = [];

  startFlag = 1;
  startMs = new Date();
  startDate = "";
  startTime = "";

  var prevProcessedData = {
    predictedDance1: "Inactive",
    predictedDance2: "Inactive",
    predictedDance3: "Inactive",
    predictedPos: [1, 2, 3],
    syncDelay: 0,
  };

  // Sockets for raw data
  // {aX:num, aY:num, aZ:num, gX:num, gY:num, gZ:num}
  D1HandDataStream.on("change", (change) => {
    switch (change.operationType) {
      case "insert":
        if (startFlag) {
          var startMs = new Date();
          startDate =
            startMs.getFullYear() +
            "-" +
            (startMs.getMonth() + 1) +
            "-" +
            startMs.getDate();
          startTime =
            startMs.getHours() +
            ":" +
            startMs.getMinutes() +
            ":" +
            startMs.getSeconds();
          startFlag = 0;
          console.log(startTime);
        }

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
        if (counter_1 % samplingRaw == 0) {
          tempD1aX = tempD1aX / samplingRaw;
          tempD1aY = tempD1aY / samplingRaw;
          tempD1aZ = tempD1aZ / samplingRaw;
          tempD1gX = tempD1gX / samplingRaw;
          tempD1gY = tempD1gY / samplingRaw;
          tempD1gZ = tempD1gZ / samplingRaw;

          const FinalData = {
            aX: tempD1aX.toFixed(2),
            aY: tempD1aY.toFixed(2),
            aZ: tempD1aZ.toFixed(2),

            gX: tempD1gX.toFixed(2),
            gY: tempD1gY.toFixed(2),
            gZ: tempD1gZ.toFixed(2),
          };
          io.emit("SERVER_D1_DATA", FinalData);
          io.emit("SERVER_PROCESSED_DATA", prevProcessedData);
          overallDancer1Data.push(FinalData);
          tempD1aX = tempD1aY = tempD1aZ = tempD1gX = tempD1gY = tempD1gZ = 0;
        }
        counter_1 += 1;
    }
  });

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
        if (counter_2 % samplingRaw == 0) {
          tempD2aX = tempD2aX / samplingRaw;
          tempD2aY = tempD2aY / samplingRaw;
          tempD2aZ = tempD2aZ / samplingRaw;
          tempD2gX = tempD2gX / samplingRaw;
          tempD2gY = tempD2gY / samplingRaw;
          tempD2gZ = tempD2gZ / samplingRaw;

          const FinalData = {
            aX: tempD2aX.toFixed(2),
            aY: tempD2aY.toFixed(2),
            aZ: tempD2aZ.toFixed(2),

            gX: tempD2gX.toFixed(2),
            gY: tempD2gY.toFixed(2),
            gZ: tempD2gZ.toFixed(2),
          };
          io.emit("SERVER_D2_DATA", FinalData);
          io.emit("SERVER_PROCESSED_DATA", prevProcessedData);
          overallDancer2Data.push(FinalData);
          tempD2aX = tempD2aY = tempD2aZ = tempD2gX = tempD2gY = tempD2gZ = 0;
        }
        counter_2 += 1;
    }
  });

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
        if (counter_3 % samplingRaw == 0) {
          tempD3aX = tempD3aX / samplingRaw;
          tempD3aY = tempD3aY / samplingRaw;
          tempD3aZ = tempD3aZ / samplingRaw;
          tempD3gX = tempD3gX / samplingRaw;
          tempD3gY = tempD3gY / samplingRaw;
          tempD3gZ = tempD3gZ / samplingRaw;

          const FinalData = {
            aX: tempD3aX.toFixed(2),
            aY: tempD3aY.toFixed(2),
            aZ: tempD3aZ.toFixed(2),
            gX: tempD3gX.toFixed(2),
            gY: tempD3gY.toFixed(2),
            gZ: tempD3gZ.toFixed(2),
          };
          io.emit("SERVER_D3_DATA", FinalData);
          io.emit("SERVER_PROCESSED_DATA", prevProcessedData);
          overallDancer3Data.push(FinalData);
          tempD3aX = tempD3aY = tempD3aZ = tempD3gX = tempD3gY = tempD3gZ = 0;
        }
        counter_3 += 1;
    }
  });

  // Socket for emg data
  // {emgMean:num}
  EmgDataStream.on("change", (change) => {
    switch (change.operationType) {
      case "insert":
        const EmgData = {
          // emgMean: Number(change.fullDocument.emgMean),
          emgMean: (Math.random() * (0.12 - 0.02) + 0.02).toFixed(4),
        };

        // Get cumulative in a sample
        tempEmgMean += Number(EmgData.emgMean);

        // Send ave data at a specified freq
        if (counter_4 % samplingRaw == 0) {
          tempEmgMean = tempEmgMean / samplingRaw;

          const FinalData = {
            emgMean: Number(tempEmgMean.toFixed(2)),
          };
          io.emit("SERVER_EMG_DATA", FinalData);
          overallEmgData.push(FinalData);
          tempEmgMean = 0;
        }

        counter_4 += 1;
    }
  });

  // Sockets for processed data
  // {predictedDance:string, predictedPos:array}
  ProcessedDataStream.on("change", (change) => {
    switch (change.operationType) {
      case "insert":
        receivedProcessedDataFlag = 0;
        if (
          change.fullDocument.predictedDance1 === "Logout" &&
          change.fullDocument.predictedDance2 === "Logout" &&
          change.fullDocument.predictedDance3 === "Logout"
        ) {
          var endMs = new Date();
          var duration = (endMs.getTime() - startMs.getTime()) / 1000;
          const historyObj = {
            date: startDate.toString(),
            time: startTime.toString(),
            duration: duration.toString(),
            overallEmgData: overallEmgData,
            overallDancer1Data: overallDancer1Data,
            overallDancer2Data: overallDancer2Data,
            overallDancer3Data: overallDancer3Data,
          };
          connection.collection("history_datas").insertOne(historyObj);
          io.emit("SERVER_LOGOUT");
          console.log("New entry in history collection");
        }

        const ProcessedData = {
          predictedDance1: change.fullDocument.predictedDance1,
          predictedDance2: change.fullDocument.predictedDance2,
          predictedDance3: change.fullDocument.predictedDance3,
          predictedPos: change.fullDocument.predictedPos.split("|").map(Number),
          syncDelay: Number(change.fullDocument.syncDelay).toFixed(2),
        };
        if (counter_5 % samplingProcessed == 0) {
          prevProcessedData = ProcessedData;
          io.emit("SERVER_PROCESSED_DATA", ProcessedData);
        }
        counter_5 += 1;
    }
  });

  // Sockets for coach data
  // {actualDance:string, actualPositions:array}
  CoachDataStream.on("change", (change) => {
    switch (change.operationType) {
      case "insert":
        const coachData = {
          actualDance: change.fullDocument.actualDance,
          actualPositions: change.fullDocument.actualPositions
            .split("|")
            .map(Number),
        };
        io.emit("SERVER_COACH_DATA", coachData);
    }
  });
});

// ---------------- HTTP Requests ---------------- //
const historyRoute = require("./routes/historyRoute");
app.use("/api/history", historyRoute);

const processedDataRoute = require("./routes/processedDataRoute");
app.use("/api/processeddata", processedDataRoute);

const rawDataRoute = require("./routes/rawDataRoute");
app.use("/api/rawdata", rawDataRoute);

server.listen(PORT, () => console.log(`Server running on port ${PORT}`));
