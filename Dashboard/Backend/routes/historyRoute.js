const express = require("express");
const router = express.Router();

const getAllHistory = require("../controller/historyController");

// GET all products -> /api/products
router.get("/", getAllHistory);

module.exports = router;
