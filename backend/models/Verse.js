const { DataTypes } = require("sequelize");
const { sequelize } = require("../config/database");

const Verse = sequelize.define(
  "Verse",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    chapter_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    book_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    verse_no: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    text_ar: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    text_en: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    text_ur: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
    audio_url: {
      type: DataTypes.TEXT,
      allowNull: true,
    },
  },
  {
    tableName: "Verse",
    timestamps: false,
  }
);

module.exports = Verse;

