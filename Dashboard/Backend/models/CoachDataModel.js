const mongoose = require("mongoose");

const coachDataSchema = mongoose.Schema({
  actualDance: { type: String, required: true, trim: true },
  actualPositions: {
    type: String,
    required: true,
    trim: true,
  },
});

const CoachDataModel = mongoose.model("coach_data", coachDataSchema);

module.exports = CoachDataModel;
