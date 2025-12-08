const Type = require("./Type");
const Book = require("./Book");
const Chapter = require("./Chapter");
const Verse = require("./Verse");

// Define associations
Book.belongsTo(Type, { foreignKey: "type_id", as: "type" });
Type.hasMany(Book, { foreignKey: "type_id", as: "books" });

Chapter.belongsTo(Book, { foreignKey: "book_id", as: "book" });
Book.hasMany(Chapter, { foreignKey: "book_id", as: "chapters" });

Verse.belongsTo(Chapter, { foreignKey: "chapter_id", as: "chapter" });
Verse.belongsTo(Book, { foreignKey: "book_id", as: "book" });
Chapter.hasMany(Verse, { foreignKey: "chapter_id", as: "verses" });
Book.hasMany(Verse, { foreignKey: "book_id", as: "verses" });

module.exports = {
  Type,
  Book,
  Chapter,
  Verse,
};

