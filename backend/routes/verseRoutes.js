const express = require("express");
const router = express.Router();
const {
  getAllVerses,
  getVerseById,
  getVersesByChapterId,
  getVersesByBookId,
  createVerse,
  updateVerse,
  deleteVerse,
} = require("../controllers/verseController");

// Get all verses
router.get("/", getAllVerses);

// Get verse by ID
router.get("/:id", getVerseById);

// Get verses by chapter ID
router.get("/chapter/:chapterId", getVersesByChapterId);

// Get verses by book ID
router.get("/book/:bookId", getVersesByBookId);

// Create new verse
router.post("/", createVerse);

// Update verse
router.put("/:id", updateVerse);

// Delete verse
router.delete("/:id", deleteVerse);

module.exports = router;



