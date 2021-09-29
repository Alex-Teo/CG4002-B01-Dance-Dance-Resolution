const mongoose = require("mongoose");

const processedDataSchema = mongoose.Schema({
  userID: { type: String, required: true, trim: true },
  timestamp: { type: String, required: true, default: Date.now(), trim: true },
  predictedDance: { type: String, required: true, trim: true },
  predictedPos: { type: String, required: true, trim: true },
  syncDelay: { type: String, required: true, trim: true },
});

const Dancer1ProcessedDataModel = mongoose.model(
  "dancer_1_processed_data",
  processedDataSchema
);
const Dancer2ProcessedDataModel = mongoose.model(
  "dancer_2_processed_data",
  processedDataSchema
);
const Dancer3ProcessedDataModel = mongoose.model(
  "dancer_3_processed_data",
  processedDataSchema
);

module.exports = {
  Dancer1ProcessedDataModel,
  Dancer2ProcessedDataModel,
  Dancer3ProcessedDataModel,
};
