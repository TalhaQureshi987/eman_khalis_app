const sqlite3 = require("sqlite3").verbose();
const path = require("path");

// Database file path
const dbPath = path.join(__dirname, "database.sqlite");

// Create/Open database connection
const db = new sqlite3.Database(dbPath, (err) => {
  if (err) {
    console.error("Database connection error:", err.message);
  } else {
    console.log("✅ SQLite database connected successfully!");
    console.log("📁 Database file:", dbPath);
  }
});

// Initialize database tables
function initializeDatabase() {
  return new Promise((resolve, reject) => {
    db.serialize(() => {
      // Type table
      db.run(
        `CREATE TABLE IF NOT EXISTS Type (
        type_id INTEGER PRIMARY KEY AUTOINCREMENT,
        type_name TEXT
      )`,
        (err) => {
          if (err) {
            console.error("Error creating Type table:", err.message);
            reject(err);
          } else {
            console.log("✅ Type table created/verified");
          }
        }
      );

      // Book table
      db.run(
        `CREATE TABLE IF NOT EXISTS Book (
        book_id INTEGER PRIMARY KEY,
        book_name_ar TEXT,
        book_name_en TEXT,
        book_name_ur TEXT,
        cover_image TEXT,
        cover_image_url TEXT,
        download_url TEXT,
        status TEXT,
        updated_on TEXT,
        type_id INTEGER,
        FOREIGN KEY (type_id) REFERENCES Type(type_id)
      )`,
        (err) => {
          if (err) {
            console.error("Error creating Book table:", err.message);
            reject(err);
          } else {
            console.log("✅ Book table created/verified");
          }
        }
      );

      // Chapter table
      db.run(
        `CREATE TABLE IF NOT EXISTS Chapter (
        chapter_id INTEGER PRIMARY KEY AUTOINCREMENT,
        book_id INTEGER,
        chapter_name_ar TEXT,
        chapter_name_en TEXT,
        chapter_name_ur TEXT,
        page_no INTEGER,
        download_url TEXT,
        status TEXT,
        category_name TEXT,
        FOREIGN KEY (book_id) REFERENCES Book(book_id)
      )`,
        (err) => {
          if (err) {
            console.error("Error creating Chapter table:", err.message);
            reject(err);
          } else {
            console.log("✅ Chapter table created/verified");
          }
        }
      );

      // Verse table
      db.run(
        `CREATE TABLE IF NOT EXISTS Verse (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        chapter_id INTEGER,
        book_id INTEGER,
        verse_no INTEGER,
        text_ar TEXT,
        text_en TEXT,
        text_ur TEXT,
        audio_url TEXT,
        FOREIGN KEY (chapter_id) REFERENCES Chapter(chapter_id),
        FOREIGN KEY (book_id) REFERENCES Book(book_id)
      )`,
        (err) => {
          if (err) {
            console.error("Error creating Verse table:", err.message);
            reject(err);
          } else {
            console.log("✅ Verse table created/verified");
          }
        }
      );

      // Insert Type data
      db.run(
        `INSERT OR IGNORE INTO Type (type_id, type_name) VALUES 
        (1, 'Quran'),
        (2, 'Hadees'),
        (3, 'Habullah'),
        (4, 'Audio'),
        (5, 'Kitabchay')
      `,
        (err) => {
          if (err) {
            console.error("Error inserting Type data:", err.message);
          } else {
            console.log("✅ Type data inserted");
          }
        }
      );

      // Insert Book data
      db.run(
        `INSERT OR IGNORE INTO Book (book_id, book_name_ar, book_name_en, book_name_ur, cover_image, cover_image_url, download_url, status, updated_on, type_id) VALUES
        (1, 'القرآن', 'Quran', 'قرآن', NULL, NULL, NULL, 'pending', NULL, 1),
        (2, 'صحيح البخاري', 'Sahih Bukhari', 'صحیح بخاری', NULL, NULL, NULL, 'pending', NULL, 2),
        (3, 'صحيح مسلم', 'Sahih Muslim', 'صحیح مسلم', NULL, NULL, NULL, 'pending', NULL, 2),
        (4, 'سنن أبي داود', 'Abu Dawood', 'ابو داؤد', NULL, NULL, NULL, 'pending', NULL, 2),
        (5, 'جامع الترمذي', 'Al-Tirmazi', 'الترمذی', NULL, NULL, NULL, 'pending', NULL, 2),
        (6, 'حب الله', 'Habullah', 'حب اللہ', NULL, NULL, NULL, 'pending', NULL, 3),
        (7, 'Audio Collection', 'Audio Collection', 'آڈیو کلیکشن', NULL, NULL, NULL, 'pending', NULL, 4),
        (8, 'تعویذ کا شرک', 'Taweez Ka Shirk', 'تعویذ کا شرک', NULL, NULL, 'http://taweezkashirk.pdf', 'pending', NULL, 5),
        (9, 'وسیلہ کا شرک', 'Waseelay Ka Shirk', 'وسیلہ کا شرک', NULL, NULL, 'http://waseelayKaShirk.pdf', 'pending', NULL, 5),
        (10, 'صلوٰۃ', 'Salat', 'نماز', NULL, NULL, 'http://salat.pdf', 'pending', NULL, 5),
        (11, 'حج و عمرہ', 'Hajj & Umra', 'حج و عمرہ', NULL, NULL, 'http://hajjUmra.pdf', 'pending', NULL, 5),
        (12, 'مسنون دعا', 'Masnoon Dua', 'مسنون دعا', NULL, NULL, 'http://masnoondua.pdf', 'pending', NULL, 5)
      `,
        (err) => {
          if (err) {
            console.error("Error inserting Book data:", err.message);
          } else {
            console.log("✅ Book data inserted");
          }
        }
      );

      // Insert Chapter data
      db.run(
        `INSERT OR IGNORE INTO Chapter (chapter_id, book_id, chapter_name_ar, chapter_name_en, chapter_name_ur, page_no, download_url, status, category_name) VALUES
        (1, 7, 'الفصل 1', 'Chapter 1', 'باب 1', NULL, NULL, 'pending', 'Audio Chapter')
      `,
        (err) => {
          if (err) {
            console.error("Error inserting Chapter data:", err.message);
          } else {
            console.log("✅ Chapter data inserted");
          }
        }
      );

      // Insert Verse data
      db.run(
        `INSERT OR IGNORE INTO Verse (chapter_id, book_id, verse_no, text_ar, text_en, text_ur, audio_url) VALUES
        (1, 7, 1, 'Dars on Shirk', 'Dars on Shirk', 'Dars on Shirk', 'https://theemanekhalis/audiofile1.mp3'),
        (1, 7, 2, 'Dars on Shirk', 'Dars on Shirk', 'Dars on Shirk', 'https://theemanekhalis/audiofile2.mp3'),
        (1, 7, 3, 'Dars on Shirk', 'Dars on Shirk', 'Dars on Shirk', 'https://theemanekhalis/audiofile3.mp3'),
        (1, 7, 4, 'Dars on Shirk', 'Dars on Shirk', 'Dars on Shirk', 'https://theemanekhalis/audiofile4.mp3'),
        (1, 7, 5, 'Dars on Shirk', 'Dars on Shirk', 'Dars on Shirk', 'https://theemanekhalis/audiofile5.mp3'),
        (1, 7, 6, 'Dars on Shirk', 'Dars on Shirk', 'Dars on Shirk', 'https://theemanekhalis/audiofile6.mp3'),
        (1, 7, 7, 'Dars on Shirk', 'Dars on Shirk', 'Dars on Shirk', 'https://theemanekhalis/audiofile7.mp3'),
        (1, 7, 8, 'Dars on Shirk', 'Dars on Shirk', 'Dars on Shirk', 'https://theemanekhalis/audiofile8.mp3'),
        (1, 7, 9, 'Dars on Shirk', 'Dars on Shirk', 'Dars on Shirk', 'https://theemanekhalis/audiofile9.mp3'),
        (1, 7, 10, 'Dars on Shirk', 'Dars on Shirk', 'Dars on Shirk', 'https://theemanekhalis/audiofile10.mp3'),
        (1, 7, 11, 'Dars on Shirk', 'Dars on Shirk', 'Dars on Shirk', 'https://theemanekhalis/audiofile11.mp3'),
        (1, 7, 12, 'Dars on Shirk', 'Dars on Shirk', 'Dars on Shirk', 'https://theemanekhalis/audiofile12.mp3'),
        (1, 7, 13, 'Dars on Shirk', 'Dars on Shirk', 'Dars on Shirk', 'https://theemanekhalis/audiofile13.mp3'),
        (1, 7, 14, 'Dars on Shirk', 'Dars on Shirk', 'Dars on Shirk', 'https://theemanekhalis/audiofile14.mp3'),
        (1, 7, 15, 'Dars on Shirk', 'Dars on Shirk', 'Dars on Shirk', 'https://theemanekhalis/audiofile15.mp3')
      `,
        (err) => {
          if (err) {
            console.error("Error inserting Verse data:", err.message);
          } else {
            console.log("✅ Verse data inserted");
          }
        }
      );

      console.log("\n🎉 Database initialization completed!");
      resolve();
    });
  });
}

// Close database connection
function closeDatabase() {
  return new Promise((resolve, reject) => {
    db.close((err) => {
      if (err) {
        console.error("Error closing database:", err.message);
        reject(err);
      } else {
        console.log("✅ Database connection closed");
        resolve();
      }
    });
  });
}

// Export database instance and functions
module.exports = {
  db,
  initializeDatabase,
  closeDatabase,
};
