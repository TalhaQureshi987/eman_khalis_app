const express = require("express");
const router = express.Router();
const {
  getAllBooks,
  getBookById,
  getBooksByType,
  createBook,
  updateBook,
  deleteBook,
} = require("../controllers/bookController");

// Get all books
router.get("/", getAllBooks);

// Get book by ID
router.get("/:id", getBookById);

// Get books by type
router.get("/type/:typeId", getBooksByType);

// Create new book
router.post("/", createBook);

// Update book
router.put("/:id", updateBook);

// Delete book
router.delete("/:id", deleteBook);

module.exports = router;



