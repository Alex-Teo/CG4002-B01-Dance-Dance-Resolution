const mongoose = require("mongoose");

const coachDataSchema = mongoose.Schema({
  timestamp: { type: String, required: true, default: Date.now(), trim: true },
  actualDance: { type: String, required: true, trim: true },
  actualPositions: {
    type: String,
    required: true,
    default: Date.now(),
    trim: true,
  },
  dancer1Feedback: { type: String, required: true, trim: true },
  dancer2Feedback: { type: String, required: true, trim: true },
  dancer3Feedback: { type: String, required: true, trim: true },
});

const CoachDataModel = mongoose.model("coach_data", coachDataSchema);

module.exports = CoachDataModel;
