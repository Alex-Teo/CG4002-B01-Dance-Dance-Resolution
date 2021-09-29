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
const {
  dancer1RawDataDummy,
  dancer2RawDataDummy,
  dancer3RawDataDummy,
} = require("./data/rawDataDummy");
const {
  dancer1ProcessedDataDummy,
  dancer2ProcessedDataDummy,
  dancer3ProcessedDataDummy,
  coachDataDummy,
} = require("./data/processedDataDummy");
const {
  Dancer1RawDataModel,
  Dancer2RawDataModel,
  Dancer3RawDataModel,
} = require("./models/RawDataModel");
const {
  Dancer1ProcessedDataModel,
  Dancer2ProcessedDataModel,
  Dancer3ProcessedDataModel,
} = require("./models/ProcessedDataModel");
const CoachDataModel = require("./models/CoachDataModel");

// Fxn importData() used for testing -> importing of dummy data
const importData = async () => {
  try {
    const timer = (ms) => new Promise((res) => setTimeout(res, ms));
    let div = coachDataDummy.length / dancer1RawDataDummy.length;
    let delay = 1000;

    // Clear exisiting collections
    await Dancer1RawDataModel.deleteMany({});
    await Dancer2RawDataModel.deleteMany({});
    await Dancer3RawDataModel.deleteMany({});
    await Dancer2ProcessedDataModel.deleteMany({});
    await Dancer1ProcessedDataModel.deleteMany({});
    await Dancer3ProcessedDataModel.deleteMany({});
    await Dancer3ProcessedDataModel.deleteMany({});

    // Add in dummy data at 1000ms intervals
    for (var i = 0; i < dancer1RawDataDummy.length; i++) {
      await Dancer1RawDataModel.insertMany(dancer1RawDataDummy[i]);
      await Dancer2RawDataModel.insertMany(dancer2RawDataDummy[i]);
      await Dancer3RawDataModel.insertMany(dancer3RawDataDummy[i]);
      await Dancer1ProcessedDataModel.insertMany(dancer1ProcessedDataDummy[i]);
      await Dancer2ProcessedDataModel.insertMany(dancer2ProcessedDataDummy[i]);
      await Dancer3ProcessedDataModel.insertMany(dancer3ProcessedDataDummy[i]);
      // console.log(`Insert Raw and Processed Data ${i}`);
      await timer(delay);
      for (var j = 0; j < div; j++) {
        await CoachDataModel.insertMany(coachDataDummy[div * i + j]);
        // console.log(`Insert Coach Data ${div * i + j}`);
        await timer(delay / 1.5);
      }
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

  await connection.dropCollection("dancer_1_processed_datas");
  await connection.dropCollection("dancer_2_processed_datas");
  await connection.dropCollection("dancer_3_processed_datas");
  await connection.dropCollection("dancer_1_raw_datas");
  await connection.dropCollection("dancer_2_raw_datas");
  await connection.dropCollection("dancer_3_raw_datas");
  await connection.dropCollection("coach_datas");
  console.log(" MongoDB: Deleted old collections");

  await connection.createCollection("dancer_1_processed_datas");
  await connection.createCollection("dancer_2_processed_datas");
  await connection.createCollection("dancer_3_processed_datas");
  await connection.createCollection("dancer_1_raw_datas");
  await connection.createCollection("dancer_2_raw_datas");
  await connection.createCollection("dancer_3_raw_datas");
  await connection.createCollection("coach_datas");
  console.log(" MongoDB: Creating fresh collections");

  // Setup change streams
  const dancer1RawDataStream = connection
    .collection("dancer_1_raw_datas")
    .watch();
  const dancer2RawDataStream = connection
    .collection("dancer_2_raw_datas")
    .watch();
  const dancer3RawDataStream = connection
    .collection("dancer_3_raw_datas")
    .watch();
  const dancer1ProcessedDataStream = connection
    .collection("dancer_1_processed_datas")
    .watch();
  const dancer2ProcessedDataStream = connection
    .collection("dancer_2_processed_datas")
    .watch();
  const dancer3ProcessedDataStream = connection
    .collection("dancer_3_processed_datas")
    .watch();
  const coachDataStream = connection.collection("coach_datas").watch();
  console.log(" MongoDB (Change Streams): Watching collections as streams");

  // Setup io emits on changes detected in changeStream
});

// ---------------- Routing (old) ---------------- //
// const rawDataRoute = require("./routes/rawDataRoute");
// const processedDataRoute = require("./routes/processedDataRoute");

// app.use("/rawData", rawDataRoute);
// app.use("/processedData", processedDataRoute);

// ---------------- Server Start ---------------- //
server.listen(PORT, () => console.log(`Server running on port ${PORT}`));
