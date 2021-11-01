const express = require("express");
const router = express.Router();
const authUser = require("../controller/authController");

// Register
router.post("/", authUser);

module.exports = router;
