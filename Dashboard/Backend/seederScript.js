require("dotenv").config();

const sensorDataDummy = require("./data/sensorDataDummy");

const SensorData = require("./models/SensorData");

const connectDB = require("./config/db");

connectDB();

const importData = async () => {
  try {
    await SensorData.deleteMany({});
    await SensorData.insertMany(sensorDataDummy);

    console.log("Data Import SUCCESS");

    process.exit();
  } catch (error) {
    console.error("Error with data import", error);
    process.exit(1);
  }
};

importData();
