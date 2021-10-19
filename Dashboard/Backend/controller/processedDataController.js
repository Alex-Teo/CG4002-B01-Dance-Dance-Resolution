const ProcessedData = require("../models/ProcessedData");

const getProcessedData = async (req, res) => {
  try {
    const processedData = await ProcessedData.find({});
    res.json(processedData);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

module.exports = {
  getProcessedData,
};
