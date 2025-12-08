const { Chapter, Book, Verse } = require("../models");

// Get all chapters
const getAllChapters = async (req, res) => {
  try {
    const chapters = await Chapter.findAll({
      include: [
        {
          model: Book,
          as: "book",
        },
      ],
    });
    res.json({ success: true, data: chapters });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Get chapter by ID
const getChapterById = async (req, res) => {
  try {
    const { id } = req.params;
    const chapter = await Chapter.findByPk(id, {
      include: [
        {
          model: Book,
          as: "book",
        },
        {
          model: Verse,
          as: "verses",
        },
      ],
    });
    if (!chapter) {
      return res
        .status(404)
        .json({ success: false, error: "Chapter not found" });
    }
    res.json({ success: true, data: chapter });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Get chapters by book ID
const getChaptersByBookId = async (req, res) => {
  try {
    const { bookId } = req.params;
    const chapters = await Chapter.findAll({
      where: { book_id: bookId },
      include: [
        {
          model: Book,
          as: "book",
        },
      ],
    });
    res.json({ success: true, data: chapters });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Create new chapter
const createChapter = async (req, res) => {
  try {
    const chapter = await Chapter.create(req.body);
    res.status(201).json({ success: true, data: chapter });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Update chapter
const updateChapter = async (req, res) => {
  try {
    const { id } = req.params;
    const [updated] = await Chapter.update(req.body, {
      where: { chapter_id: id },
    });
    if (!updated) {
      return res
        .status(404)
        .json({ success: false, error: "Chapter not found" });
    }
    const chapter = await Chapter.findByPk(id);
    res.json({ success: true, data: chapter });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Delete chapter
const deleteChapter = async (req, res) => {
  try {
    const { id } = req.params;
    const deleted = await Chapter.destroy({
      where: { chapter_id: id },
    });
    if (!deleted) {
      return res
        .status(404)
        .json({ success: false, error: "Chapter not found" });
    }
    res.json({ success: true, message: "Chapter deleted successfully" });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

module.exports = {
  getAllChapters,
  getChapterById,
  getChaptersByBookId,
  createChapter,
  updateChapter,
  deleteChapter,
};



