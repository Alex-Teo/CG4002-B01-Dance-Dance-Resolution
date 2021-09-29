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

const Dancer1RawDataModel = mongoose.model("dancer_1_raw_data", rawDataSchema);
const Dancer2RawDataModel = mongoose.model("dancer_2_raw_data", rawDataSchema);
const Dancer3RawDataModel = mongoose.model("dancer_3_raw_data", rawDataSchema);

module.exports = {
  Dancer1RawDataModel,
  Dancer2RawDataModel,
  Dancer3RawDataModel,
};
