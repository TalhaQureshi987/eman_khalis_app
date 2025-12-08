const { Verse, Chapter, Book } = require("../models");

// Get all verses
const getAllVerses = async (req, res) => {
  try {
    const verses = await Verse.findAll({
      include: [
        {
          model: Chapter,
          as: "chapter",
        },
        {
          model: Book,
          as: "book",
        },
      ],
    });
    res.json({ success: true, data: verses });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Get verse by ID
const getVerseById = async (req, res) => {
  try {
    const { id } = req.params;
    const verse = await Verse.findByPk(id, {
      include: [
        {
          model: Chapter,
          as: "chapter",
        },
        {
          model: Book,
          as: "book",
        },
      ],
    });
    if (!verse) {
      return res.status(404).json({ success: false, error: "Verse not found" });
    }
    res.json({ success: true, data: verse });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Get verses by chapter ID
const getVersesByChapterId = async (req, res) => {
  try {
    const { chapterId } = req.params;
    const verses = await Verse.findAll({
      where: { chapter_id: chapterId },
      include: [
        {
          model: Chapter,
          as: "chapter",
        },
        {
          model: Book,
          as: "book",
        },
      ],
      order: [["verse_no", "ASC"]],
    });
    res.json({ success: true, data: verses });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Get verses by book ID
const getVersesByBookId = async (req, res) => {
  try {
    const { bookId } = req.params;
    const verses = await Verse.findAll({
      where: { book_id: bookId },
      include: [
        {
          model: Chapter,
          as: "chapter",
        },
        {
          model: Book,
          as: "book",
        },
      ],
      order: [["verse_no", "ASC"]],
    });
    res.json({ success: true, data: verses });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Create new verse
const createVerse = async (req, res) => {
  try {
    const verse = await Verse.create(req.body);
    res.status(201).json({ success: true, data: verse });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Update verse
const updateVerse = async (req, res) => {
  try {
    const { id } = req.params;
    const [updated] = await Verse.update(req.body, {
      where: { id: id },
    });
    if (!updated) {
      return res.status(404).json({ success: false, error: "Verse not found" });
    }
    const verse = await Verse.findByPk(id);
    res.json({ success: true, data: verse });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Delete verse
const deleteVerse = async (req, res) => {
  try {
    const { id } = req.params;
    const deleted = await Verse.destroy({
      where: { id: id },
    });
    if (!deleted) {
      return res.status(404).json({ success: false, error: "Verse not found" });
    }
    res.json({ success: true, message: "Verse deleted successfully" });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

module.exports = {
  getAllVerses,
  getVerseById,
  getVersesByChapterId,
  getVersesByBookId,
  createVerse,
  updateVerse,
  deleteVerse,
};



