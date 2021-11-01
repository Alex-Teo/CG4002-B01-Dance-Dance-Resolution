const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  email: { type: String, required: true, trim: true },
  password: { type: String, required: true, trim: true },
  regDate: { type: Date, default: Date.now(), required: true, trim: true },
});

const User = mongoose.model("user", userSchema);

module.exports = User;
