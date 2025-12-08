const { sequelize, testConnection } = require("./config/database");
const { Type, Book, Chapter, Verse } = require("./models");
const seedDatabase = require("./seeders/seedData");

// Initialize database
async function initializeDatabase() {
  try {
    console.log("🚀 Starting database setup...\n");

    // Test connection
    const connected = await testConnection();
    if (!connected) {
      throw new Error("Database connection failed");
    }

    // Sync all models (create tables)
    await sequelize.sync({ force: false, alter: false });
    console.log("✅ All tables synced successfully\n");

    // Seed initial data
    await seedDatabase();

    console.log("\n✨ Database setup completed successfully!");
    await sequelize.close();
    process.exit(0);
  } catch (error) {
    console.error("❌ Database setup failed:", error);
    await sequelize.close();
    process.exit(1);
  }
}

initializeDatabase();
