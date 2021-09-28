const ProcessedDataModel = require("../models/ProcessedDataModel");

const getProcessedData = async (req, res) => {
  try {
    const processedData = await ProcessedDataModel.find({});
    res.json(processedData);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

module.exports = {
  getProcessedData,
};
