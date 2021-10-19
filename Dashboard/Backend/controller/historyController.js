const History = require("../models/History");

const getAllHistory = async (req, res) => {
  try {
    const history = await History.find({});
    res.json(history);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

module.exports = getAllHistory;
