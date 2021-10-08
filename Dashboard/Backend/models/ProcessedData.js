const mongoose = require("mongoose");

const processedDataSchema = mongoose.Schema({
  predictedDance: { type: String, required: true, trim: true }, // Dance
  predictedPos: { type: String, required: true, trim: true }, // pos1 | pos2 | pos3
  syncDelay: { type: String, required: true, trim: true }, // delay
});

const ProcessedData = mongoose.model("processed_data", processedDataSchema);

module.exports = ProcessedData;
