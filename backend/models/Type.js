const { DataTypes } = require("sequelize");
const { sequelize } = require("../config/database");

const Type = sequelize.define(
  "Type",
  {
    type_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    type_name: {
      type: DataTypes.STRING,
      allowNull: true,
    },
  },
  {
    tableName: "Type",
    timestamps: false,
  }
);

module.exports = Type;



