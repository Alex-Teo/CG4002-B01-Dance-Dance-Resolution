const mongoose = require("mongoose");

const emgDataSchema = mongoose.Schema({
  emgMean: { type: String, required: true, trim: true },
});

const EmgData = mongoose.model("emg_data", emgDataSchema);

module.exports = EmgData;
