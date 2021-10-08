const mongoose = require("mongoose");

const emgDataSchema = mongoose.Schema({
  d1Emg: { type: String, required: true, trim: true },
  d2Emg: { type: String, required: true, trim: true },
  d3Emg: { type: String, required: true, trim: true },
});

const EmgData = mongoose.model("emg_data", emgDataSchema);

module.exports = EmgData;
