const { DataTypes } = require("sequelize");
const { sequelize } = require("../config/database");

const Chapter = sequelize.define(
  "Chapter",
  {
    chapter_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    book_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    chapter_name_ar: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    chapter_name_en: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    chapter_name_ur: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    page_no: {
      type: DataTypes.INTEGER,
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
    category_name: {
      type: DataTypes.STRING,
      allowNull: true,
    },
  },
  {
    tableName: "Chapter",
    timestamps: false,
  }
);

module.exports = Chapter;

