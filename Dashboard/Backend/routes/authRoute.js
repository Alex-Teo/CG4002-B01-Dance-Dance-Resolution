const express = require("express");
const router = express.Router();
const { authUser, getUserData } = require("../controller/authController");

const auth = require("../middleware/auth");

// Auth
router.post("/", authUser);

router.get("/user", auth, getUserData);

module.exports = router;
