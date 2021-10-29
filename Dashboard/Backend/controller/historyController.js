const { mongo } = require("mongoose");
const HistoryData = require("../models/HistoryData");

const getAllHistory = async (req, res) => {
  try {
    const history = await HistoryData.find({});
    res.json(history);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

const getHistoryById = async (req, res) => {
  try {
    var id = req.params.id;
    var objId = mongo.ObjectID(id);
    const result = await HistoryData.find({ _id: objId });
    res.json(result);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

module.exports = { getAllHistory, getHistoryById };
