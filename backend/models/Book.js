const { DataTypes } = require("sequelize");
const { sequelize } = require("../config/database");

const Book = sequelize.define(
  "Book",
  {
    book_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
    },
    book_name_ar: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    book_name_en: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    book_name_ur: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    cover_image: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    cover_image_url: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    download_url: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    status: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    updated_on: {
      type: DataTypes.DATE,
      allowNull: true,
    },
    type_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
  },
  {
    tableName: "Book",
    timestamps: false,
  }
);

module.exports = Book;

