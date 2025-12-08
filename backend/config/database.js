const { Sequelize } = require("sequelize");
const path = require("path");

// Database file path
const dbPath = path.join(__dirname, "..", "database.sqlite");

// Create Sequelize instance
const sequelize = new Sequelize({
  dialect: "sqlite",
  storage: dbPath,
  logging: false, // Set to console.log if you want to see SQL queries
});

// Test connection
async function testConnection() {
  try {
    await sequelize.authenticate();
    console.log("✅ SQLite database connected successfully!");
    console.log("📁 Database file:", dbPath);
    return true;
  } catch (error) {
    console.error("❌ Database connection error:", error.message);
    return false;
  }
}

module.exports = { sequelize, testConnection };



