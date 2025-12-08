const express = require("express");
const router = express.Router();

const bookRoutes = require("./bookRoutes");
const chapterRoutes = require("./chapterRoutes");
const verseRoutes = require("./verseRoutes");
const typeRoutes = require("./typeRoutes");

// API routes
router.use("/books", bookRoutes);
router.use("/chapters", chapterRoutes);
router.use("/verses", verseRoutes);
router.use("/types", typeRoutes);

module.exports = router;



