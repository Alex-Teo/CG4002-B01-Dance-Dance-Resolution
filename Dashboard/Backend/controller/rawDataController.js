const RawDataModel = require("../models/RawDataModel");

const getRawData = async (req, res) => {
  try {
    const rawData = await RawDataModel.find({});
    res.json(rawData);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

module.exports = {
  getRawData,
};
