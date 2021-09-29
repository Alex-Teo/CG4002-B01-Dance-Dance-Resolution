require("dotenv").config();
const mongoose = require("mongoose");

const {
  dancer1RawDataDummy,
  dancer2RawDataDummy,
  dancer3RawDataDummy,
} = require("../data/rawDataDummy");
const {
  dancer1ProcessedDataDummy,
  dancer2ProcessedDataDummy,
  dancer3ProcessedDataDummy,
} = require("../data/processedDataDummy");

const {
  Dancer1RawDataModel,
  Dancer2RawDataModel,
  Dancer3RawDataModel,
} = require("../models/RawDataModel");
const {
  Dancer1ProcessedDataModel,
  Dancer2ProcessedDataModel,
  Dancer3ProcessedDataModel,
} = require("../models/ProcessedDataModel");

// importData() used for testing -> importing of dummy data
const importData = async () => {
  try {
    await Dancer1RawDataModel.deleteMany({});
    await Dancer1RawDataModel.insertMany(dancer1RawDataDummy);
    await Dancer2RawDataModel.deleteMany({});
    await Dancer2RawDataModel.insertMany(dancer2RawDataDummy);
    await Dancer3RawDataModel.deleteMany({});
    await Dancer3RawDataModel.insertMany(dancer3RawDataDummy);
    console.log("MongoDB: Dummy Raw Data Import SUCCESS");

    await Dancer1ProcessedDataModel.deleteMany({});
    await Dancer1ProcessedDataModel.insertMany(dancer1ProcessedDataDummy);
    await Dancer2ProcessedDataModel.deleteMany({});
    await Dancer2ProcessedDataModel.insertMany(dancer2ProcessedDataDummy);
    await Dancer3ProcessedDataModel.deleteMany({});
    await Dancer3ProcessedDataModel.insertMany(dancer3ProcessedDataDummy);
    console.log("MongoDB: Dummy Processed Data Import SUCCESS");

    process.exit();
  } catch (error) {
    console.error("MongoDB: Error with data import", error);
    process.exit(1);
  }
};

const connectDB = () => {
  mongoose.connect(process.env.MONGO_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  });

  const connection = mongoose.connection;
  connection.on("error", console.error.bind(console, "connection error:"));
  connection.once("open", async () => {
    console.log("MongoDB: Connection SUCCESS");

    await connection.dropCollection("processed_datas");
    await connection.dropCollection("dancer_1_raw_datas");
    await connection.dropCollection("dancer_2_raw_datas");
    await connection.dropCollection("dancer_3_raw_datas");
    console.log("MongoDB: Deleted old collections");

    await connection.createCollection("processed_datas");
    await connection.createCollection("dancer_1_raw_datas");
    await connection.createCollection("dancer_2_raw_datas");
    await connection.createCollection("dancer_3_raw_datas");
    console.log("MongoDB: Creating fresh collections");

    importData();
  });
};

module.exports = { connectDB };
