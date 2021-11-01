const express = require("express");
const router = express.Router();
const { authUser, getUserData } = require("../controller/authController");

const auth = require("../middleware/auth");

// Auth user
router.post("/", authUser);

// Get user data
router.get("/user", auth, getUserData);

module.exports = router;
