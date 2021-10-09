require("dotenv").config();
const mongoose = require("mongoose");

// Import Dummy Data
const emgDataDummy = require("./data/emgDataDummy");
const {
  d1RawHandDataDummy,
  d2RawHandDataDummy,
  d3RawHandDataDummy,
  d1RawChestDataDummy,
  d2RawChestDataDummy,
  d3RawChestDataDummy,
} = require("./data/rawDataDummy");
const {
  processedDataDummy,
  coachDataDummy,
} = require("./data/processedDataDummy");

// Import Models
const {
  D1RawHandData,
  D2RawHandData,
  D3RawHandData,
  D1RawChestData,
  D2RawChestData,
  D3RawChestData,
} = require("./models/RawData");
const ProcessedData = require("./models/ProcessedData");
const CoachData = require("./models/CoachData");
const EmgData = require("./models/EmgData");

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

connection.once("open", async () => {
  console.log("MongoDB: Connected");

  // await connection.dropCollection("d1_raw_hand_datas");
  // await connection.dropCollection("d2_raw_hand_datas");
  // await connection.dropCollection("d3_raw_hand_datas");
  // await connection.dropCollection("d1_raw_chest_datas");
  // await connection.dropCollection("d2_raw_chest_datas");
  // await connection.dropCollection("d3_raw_chest_datas");
  // await connection.dropCollection("emg_datas");
  // await connection.dropCollection("processed_datas");
  // await connection.dropCollection("coach_datas");
  // console.log(" MongoDB: Deleted old collections");

  // await connection.createCollection("d1_raw_hand_datas");
  // await connection.createCollection("d2_raw_hand_datas");
  // await connection.createCollection("d3_raw_hand_datas");
  // await connection.createCollection("d1_raw_chest_datas");
  // await connection.createCollection("d2_raw_chest_datas");
  // await connection.createCollection("d3_raw_chest_datas");
  // await connection.createCollection("emg_datas");
  // await connection.createCollection("processed_datas");
  // await connection.createCollection("coach_datas");
  // console.log(" MongoDB: Creating fresh collections");

  console.log(" MongoDB: Importing dummy data...");
  importData();
});

// Fxn importData() used for testing -> importing of dummy data
const importData = async () => {
  try {
    const timer = (ms) => new Promise((res) => setTimeout(res, ms));
    div = processedDataDummy.length / coachDataDummy.length;
    let delay = 50; //20hz

    // Clear exisiting collections
    await D1RawHandData.deleteMany({});
    await D2RawHandData.deleteMany({});
    await D3RawHandData.deleteMany({});
    await D1RawChestData.deleteMany({});
    await D2RawChestData.deleteMany({});
    await D3RawChestData.deleteMany({});
    await EmgData.deleteMany({});
    await ProcessedData.deleteMany({});
    await CoachData.deleteMany({});

    // Add in dummy data w delay
    for (var i = 0; i < coachDataDummy.length; i++) {
      await D1RawHandData.insertMany(d1RawHandDataDummy[i]);
      await D2RawHandData.insertMany(d2RawHandDataDummy[i]);
      await D3RawHandData.insertMany(d3RawHandDataDummy[i]);
      // await D1RawChestData.insertMany(d1RawChestDataDummy[i]);
      // await D2RawChestData.insertMany(d2RawChestDataDummy[i]);
      // await D3RawChestData.insertMany(d3RawChestDataDummy[i]);
      await EmgData.insertMany(emgDataDummy[i]);
      await ProcessedData.insertMany(processedDataDummy[i]);
      // await CoachData.insertMany(coachDataDummy[i]);
      await timer(delay);
    }

    process.exit();
  } catch (error) {
    console.error(" MongoDB: Error with data import", error);
    process.exit(1);
  }
};
