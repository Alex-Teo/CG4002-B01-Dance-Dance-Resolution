const mongoose = require("mongoose");

const historySchema = mongoose.Schema({
  date: { type: String, required: true, trim: true },
  time: { type: String, required: true, trim: true },
  duration: { type: Number, required: true, trim: true },
  overallEmgData: [
    {
      emgMean: { type: Number, required: true, trim: true },
    },
  ],
  overallDancer1Data: [
    {
      aX: { type: Number, required: true, trim: true },
      aY: { type: Number, required: true, trim: true },
      aZ: { type: Number, required: true, trim: true },
      gX: { type: Number, required: true, trim: true },
      gY: { type: Number, required: true, trim: true },
      gZ: { type: Number, required: true, trim: true },
    },
  ],
  overallDancer2Data: [
    {
      aX: { type: Number, required: true, trim: true },
      aY: { type: Number, required: true, trim: true },
      aZ: { type: Number, required: true, trim: true },
      gX: { type: Number, required: true, trim: true },
      gY: { type: Number, required: true, trim: true },
      gZ: { type: Number, required: true, trim: true },
    },
  ],
  overallDancer3Data: [
    {
      aX: { type: Number, required: true, trim: true },
      aY: { type: Number, required: true, trim: true },
      aZ: { type: Number, required: true, trim: true },
      gX: { type: Number, required: true, trim: true },
      gY: { type: Number, required: true, trim: true },
      gZ: { type: Number, required: true, trim: true },
    },
  ],
});

const History = mongoose.model("history", historySchema);

module.exports = History;
