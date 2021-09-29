require("dotenv").config();

const {
  dancer1RawDataDummy,
  dancer2RawDataDummy,
  dancer3RawDataDummy,
} = require("./data/rawDataDummy");
const processedDataDummy = require("./data/processedDataDummy");

const {
  Dancer1RawDataModel,
  Dancer2RawDataModel,
  Dancer3RawDataModel,
} = require("./models/RawDataModel");
const ProcessedDataModel = require("./models/ProcessedDataModel");

const { simpleConnectDB } = require("./config/db");

simpleConnectDB();

const importData = async () => {
  try {
    await Dancer1RawDataModel.deleteMany({});
    await Dancer1RawDataModel.insertMany(dancer1RawDataDummy);
    await Dancer2RawDataModel.deleteMany({});
    await Dancer2RawDataModel.insertMany(dancer2RawDataDummy);
    await Dancer3RawDataModel.deleteMany({});
    await Dancer3RawDataModel.insertMany(dancer3RawDataDummy);
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
