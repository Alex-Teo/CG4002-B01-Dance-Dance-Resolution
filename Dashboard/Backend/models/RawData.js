const mongoose = require("mongoose");

const rawDataSchema = mongoose.Schema({
  userID: { type: String, required: true, trim: true },
  tag: { type: String, required: true, trim: true },
  aX: { type: String, required: true, trim: true },
  aY: { type: String, required: true, trim: true },
  aZ: { type: String, required: true, trim: true },
  gX: { type: String, required: true, trim: true },
  gY: { type: String, required: true, trim: true },
  gZ: { type: String, required: true, trim: true },
});

const D1RawHandData = mongoose.model("d1_raw_hand_data", rawDataSchema);
const D2RawHandData = mongoose.model("d2_raw_hand_data", rawDataSchema);
const D3RawHandData = mongoose.model("d3_raw_hand_data", rawDataSchema);

module.exports = {
  D1RawHandData,
  D2RawHandData,
  D3RawHandData,
};
