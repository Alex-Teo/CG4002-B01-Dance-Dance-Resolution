const mongoose = require("mongoose");

const sensorDataSchema = mongoose.Schema({
  userID: { type: String, required: true },
  timestamp: { type: Date, required: true },
  aX: { type: Number, required: true },
  aY: { type: Number, required: true },
  aZ: { type: Number, required: true },
  gX: { type: Number, required: true },
  gY: { type: Number, required: true },
  gZ: { type: Number, required: true },
});

const SensorData = mongoose.model("sensorData", sensorDataSchema);

module.exports = SensorData;
