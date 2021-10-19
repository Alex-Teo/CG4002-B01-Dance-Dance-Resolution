const { D1RawHandData } = require("../models/RawData");

const getRawData = async (req, res) => {
  try {
    const rawData = await D1RawHandData.find({});
    res.json(rawData);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

module.exports = {
  getRawData,
};
