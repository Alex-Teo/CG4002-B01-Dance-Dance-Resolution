const express = require("express");
const router = express.Router();
const { getProcessedData } = require("../controller/processedDataController");

// GET all processed data
router.get("/", getProcessedData);

module.exports = router;
