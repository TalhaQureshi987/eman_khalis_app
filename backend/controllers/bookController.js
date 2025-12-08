const { Book, Type, Chapter, Verse } = require("../models");

// Get all books
const getAllBooks = async (req, res) => {
  try {
    const books = await Book.findAll({
      include: [
        {
          model: Type,
          as: "type",
        },
      ],
    });
    res.json({ success: true, data: books });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Get book by ID
const getBookById = async (req, res) => {
  try {
    const { id } = req.params;
    const book = await Book.findByPk(id, {
      include: [
        {
          model: Type,
          as: "type",
        },
        {
          model: Chapter,
          as: "chapters",
        },
      ],
    });
    if (!book) {
      return res.status(404).json({ success: false, error: "Book not found" });
    }
    res.json({ success: true, data: book });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Get books by type
const getBooksByType = async (req, res) => {
  try {
    const { typeId } = req.params;
    const books = await Book.findAll({
      where: { type_id: typeId },
      include: [
        {
          model: Type,
          as: "type",
        },
      ],
    });
    res.json({ success: true, data: books });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Create new book
const createBook = async (req, res) => {
  try {
    const book = await Book.create(req.body);
    res.status(201).json({ success: true, data: book });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Update book
const updateBook = async (req, res) => {
  try {
    const { id } = req.params;
    const [updated] = await Book.update(req.body, {
      where: { book_id: id },
    });
    if (!updated) {
      return res.status(404).json({ success: false, error: "Book not found" });
    }
    const book = await Book.findByPk(id);
    res.json({ success: true, data: book });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

// Delete book
const deleteBook = async (req, res) => {
  try {
    const { id } = req.params;
    const deleted = await Book.destroy({
      where: { book_id: id },
    });
    if (!deleted) {
      return res.status(404).json({ success: false, error: "Book not found" });
    }
    res.json({ success: true, message: "Book deleted successfully" });
  } catch (error) {
    res.status(500).json({ success: false, error: error.message });
  }
};

module.exports = {
  getAllBooks,
  getBookById,
  getBooksByType,
  createBook,
  updateBook,
  deleteBook,
};



