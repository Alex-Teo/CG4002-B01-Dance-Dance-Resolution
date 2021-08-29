const SensorData = require("../models/SensorData");

const getSensorData = async (req, res) => {
  try {
    const sensorData = await SensorData.find({});
    res.json(sensorData);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server Error" });
  }
};

module.exports = {
  getSensorData,
};
