const mongoose = require("mongoose");

const processedDataSchema = mongoose.Schema({
  userID: { type: String, required: true, trim: true },
  timestamp: { type: String, required: true, default: Date.now(), trim: true },
  correctDance: { type: String, required: true, trim: true },
  predictedDance: { type: String, required: true, trim: true },
  syncDelay: { type: String, required: true, trim: true },
});

const ProcessedDataModel = mongoose.model("processedData", processedDataSchema);

module.exports = ProcessedDataModel;
