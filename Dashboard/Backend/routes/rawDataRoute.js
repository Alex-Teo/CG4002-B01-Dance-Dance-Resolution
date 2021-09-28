const express = require("express");
const router = express.Router();
const { getRawData } = require("../controller/rawDataController");

// GET all raw data
router.get("/", getRawData);

module.exports = router;
