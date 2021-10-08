const mongoose = require("mongoose");

const coachDataSchema = mongoose.Schema({
  actualDance: { type: String, required: true, trim: true },
  actualPositions: {
    type: String,
    required: true,
    trim: true,
  },
});

const CoachData = mongoose.model("coach_data", coachDataSchema);

module.exports = CoachData;
