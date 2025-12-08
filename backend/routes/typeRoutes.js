const express = require("express");
const router = express.Router();
const { getAllTypes, getTypeById } = require("../controllers/typeController");

// Get all types
router.get("/", getAllTypes);

// Get type by ID
router.get("/:id", getTypeById);

module.exports = router;



