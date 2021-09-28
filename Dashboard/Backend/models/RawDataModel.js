const mongoose = require("mongoose");

const rawDataSchema = mongoose.Schema({
  userID: { type: String, required: true, trim: true },
  timestamp: { type: String, required: true, default: Date.now(), trim: true },
  aX: { type: String, required: true, trim: true },
  aY: { type: String, required: true, trim: true },
  aZ: { type: String, required: true, trim: true },
  gX: { type: String, required: true, trim: true },
  gY: { type: String, required: true, trim: true },
  gZ: { type: String, required: true, trim: true },
  emg: { type: String, required: true, trim: true },
});

const RawDataModel = mongoose.model("rawData", rawDataSchema);

module.exports = RawDataModel;
