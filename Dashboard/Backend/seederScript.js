require("dotenv").config();

const rawDataDummy = require("./data/rawDataDummy");
const processedDataDummy = require("./data/processedDataDummy");

const RawDataModel = require("./models/RawDataModel");
const ProcessedDataModel = require("./models/ProcessedDataModel");

const connectDB = require("./config/db");

connectDB();

const importData = async () => {
  try {
    await RawDataModel.deleteMany({});
    await RawDataModel.insertMany(rawDataDummy);

    console.log("Raw Data Import: SUCCESS");

    await ProcessedDataModel.deleteMany({});
    await ProcessedDataModel.insertMany(processedDataDummy);

    console.log("Processed Data Import: SUCCESS");

    process.exit();
  } catch (error) {
    console.error("Error with data import", error);
    process.exit(1);
  }
};

importData();
