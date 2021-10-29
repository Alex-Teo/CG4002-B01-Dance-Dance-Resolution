const express = require("express");
const router = express.Router();

const {
  getAllHistory,
  getHistoryById,
} = require("../controller/historyController");

// GET all products -> /api/products
router.get("/", getAllHistory);

router.get("/:id", getHistoryById);

module.exports = router;
