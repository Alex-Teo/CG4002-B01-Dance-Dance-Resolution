const mongoose = require("mongoose");

const historySchema = mongoose.Schema({
  date: { type: String, required: true, trim: true },
  time: { type: String, required: true, trim: true },
  overallEmgData: [
    {
      emgMean: { type: String, required: true, trim: true },
    },
  ],
  overallDancer1Data: [
    {
      aX: { type: String, required: true, trim: true },
      aY: { type: String, required: true, trim: true },
      aZ: { type: String, required: true, trim: true },
      gX: { type: String, required: true, trim: true },
      gY: { type: String, required: true, trim: true },
      gZ: { type: String, required: true, trim: true },
    },
  ],
  overallDancer2Data: [
    {
      aX: { type: String, required: true, trim: true },
      aY: { type: String, required: true, trim: true },
      aZ: { type: String, required: true, trim: true },
      gX: { type: String, required: true, trim: true },
      gY: { type: String, required: true, trim: true },
      gZ: { type: String, required: true, trim: true },
    },
  ],
  overallDancer3Data: [
    {
      aX: { type: String, required: true, trim: true },
      aY: { type: String, required: true, trim: true },
      aZ: { type: String, required: true, trim: true },
      gX: { type: String, required: true, trim: true },
      gY: { type: String, required: true, trim: true },
      gZ: { type: String, required: true, trim: true },
    },
  ],
});

const History = mongoose.model("history", historySchema);

module.exports = History;
