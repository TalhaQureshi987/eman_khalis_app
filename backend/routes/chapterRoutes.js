const express = require("express");
const router = express.Router();
const {
  getAllChapters,
  getChapterById,
  getChaptersByBookId,
  createChapter,
  updateChapter,
  deleteChapter,
} = require("../controllers/chapterController");

// Get all chapters
router.get("/", getAllChapters);

// Get chapter by ID
router.get("/:id", getChapterById);

// Get chapters by book ID
router.get("/book/:bookId", getChaptersByBookId);

// Create new chapter
router.post("/", createChapter);

// Update chapter
router.put("/:id", updateChapter);

// Delete chapter
router.delete("/:id", deleteChapter);

module.exports = router;



