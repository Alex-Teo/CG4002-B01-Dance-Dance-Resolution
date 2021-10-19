const HistoryData = require("../models/HistoryData");

const getAllHistory = async (req, res) => {
  try {
    const history = await HistoryData.find({});
    res.json(history);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

module.exports = getAllHistory;
