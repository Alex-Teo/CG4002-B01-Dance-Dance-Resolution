const express = require("express");
const router = express.Router();
const { getSensorData } = require("../controller/sensorDataController");

router.get("/", getSensorData);

module.exports = router;
