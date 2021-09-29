require("dotenv").config();
const mongoose = require("mongoose");

// Imports for dummy data
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

// importData() used for testing -> importing of dummy data
const importData = async () => {
  try {
    await Dancer1RawDataModel.deleteMany({});
    await Dancer1RawDataModel.insertMany(dancer1RawDataDummy);
    await Dancer2RawDataModel.deleteMany({});
    await Dancer2RawDataModel.insertMany(dancer2RawDataDummy);
    await Dancer3RawDataModel.deleteMany({});
    await Dancer3RawDataModel.insertMany(dancer3RawDataDummy);

    await Dancer1ProcessedDataModel.deleteMany({});
    await Dancer1ProcessedDataModel.insertMany(dancer1ProcessedDataDummy);
    await Dancer2ProcessedDataModel.deleteMany({});
    await Dancer2ProcessedDataModel.insertMany(dancer2ProcessedDataDummy);
    await Dancer3ProcessedDataModel.deleteMany({});
    await Dancer3ProcessedDataModel.insertMany(dancer3ProcessedDataDummy);

    await CoachDataModel.deleteMany({});
    await CoachDataModel.insertMany(coachDataDummy);
    console.log(" MongoDB: Dummy data imported");

    process.exit();
  } catch (error) {
    console.error(" MongoDB: Error with data import", error);
    process.exit(1);
  }
};

const connectDB = () => {
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

    // Reset the collections
    await connection.dropCollection("dancer_1_processed_data_dummies");
    await connection.dropCollection("dancer_2_processed_data_dummies");
    await connection.dropCollection("dancer_3_processed_data_dummies");
    await connection.dropCollection("dancer_1_raw_datas");
    await connection.dropCollection("dancer_2_raw_datas");
    await connection.dropCollection("dancer_3_raw_datas");
    await connection.dropCollection("coach_datas");
    console.log(" MongoDB: Deleted old collections");

    await connection.createCollection("dancer_1_processed_data_dummies");
    await connection.createCollection("dancer_2_processed_data_dummies");
    await connection.createCollection("dancer_3_processed_data_dummies");
    await connection.createCollection("dancer_1_raw_datas");
    await connection.createCollection("dancer_2_raw_datas");
    await connection.createCollection("dancer_3_raw_datas");
    await connection.createCollection("coach_datas");
    console.log(" MongoDB: Creating fresh collections");

    // To remove once testing is done
    importData();

    // Setting up change streams
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
      .collection("dancer_1_processed_data_dummies")
      .watch();
    const dancer2ProcessedDataStream = connection
      .collection("dancer_2_processed_data_dummies")
      .watch();
    const dancer3ProcessedDataStream = connection
      .collection("dancer_3_processed_data_dummies")
      .watch();
    const coachDataStream = connection.collection("coach_datas").watch();
    console.log(" MongoDB (Change Streams): Watching collections as streams");
  });
};

module.exports = {
  connectDB,
};
