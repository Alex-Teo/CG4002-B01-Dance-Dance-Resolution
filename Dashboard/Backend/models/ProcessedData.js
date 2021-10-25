const mongoose = require("mongoose");

const processedDataSchema = mongoose.Schema({
  predictedDance1: { type: String, required: true, trim: true }, // Dance
  predictedDance2: { type: String, required: true, trim: true }, // Dance
  predictedDance3: { type: String, required: true, trim: true }, // Dance
  predictedPos: { type: String, required: true, trim: true }, // pos1 | pos2 | pos3
  syncDelay: { type: String, required: true, trim: true }, // delay
});

const ProcessedData = mongoose.model("processed_data", processedDataSchema);

module.exports = ProcessedData;
