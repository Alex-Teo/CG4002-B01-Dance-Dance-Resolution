const express = require("express");
const router = express.Router();
const getUser = require("../controller/userController");

// Register
router.post("/", getUser);

module.exports = router;
