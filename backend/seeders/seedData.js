const { Type, Book, Chapter, Verse } = require("../models");

async function seedDatabase() {
  try {
    console.log("🌱 Seeding database...\n");

    // Insert Type data
    await Type.bulkCreate(
      [
        { type_id: 1, type_name: "Quran" },
        { type_id: 2, type_name: "Hadees" },
        { type_id: 3, type_name: "Habullah" },
        { type_id: 4, type_name: "Audio" },
        { type_id: 5, type_name: "Kitabchay" },
      ],
      { ignoreDuplicates: true }
    );
    console.log("✅ Type data inserted");

    // Insert Book data
    await Book.bulkCreate(
      [
        {
          book_id: 1,
          book_name_ar: "القرآن",
          book_name_en: "Quran",
          book_name_ur: "قرآن",
          cover_image: null,
          cover_image_url: null,
          download_url: null,
          status: "pending",
          updated_on: null,
          type_id: 1,
        },
        {
          book_id: 2,
          book_name_ar: "صحيح البخاري",
          book_name_en: "Sahih Bukhari",
          book_name_ur: "صحیح بخاری",
          cover_image: null,
          cover_image_url: null,
          download_url: null,
          status: "pending",
          updated_on: null,
          type_id: 2,
        },
        {
          book_id: 3,
          book_name_ar: "صحيح مسلم",
          book_name_en: "Sahih Muslim",
          book_name_ur: "صحیح مسلم",
          cover_image: null,
          cover_image_url: null,
          download_url: null,
          status: "pending",
          updated_on: null,
          type_id: 2,
        },
        {
          book_id: 4,
          book_name_ar: "سنن أبي داود",
          book_name_en: "Abu Dawood",
          book_name_ur: "ابو داؤد",
          cover_image: null,
          cover_image_url: null,
          download_url: null,
          status: "pending",
          updated_on: null,
          type_id: 2,
        },
        {
          book_id: 5,
          book_name_ar: "جامع الترمذي",
          book_name_en: "Al-Tirmazi",
          book_name_ur: "الترمذی",
          cover_image: null,
          cover_image_url: null,
          download_url: null,
          status: "pending",
          updated_on: null,
          type_id: 2,
        },
        {
          book_id: 6,
          book_name_ar: "حب الله",
          book_name_en: "Habullah",
          book_name_ur: "حب اللہ",
          cover_image: null,
          cover_image_url: null,
          download_url: null,
          status: "pending",
          updated_on: null,
          type_id: 3,
        },
        {
          book_id: 7,
          book_name_ar: "Audio Collection",
          book_name_en: "Audio Collection",
          book_name_ur: "آڈیو کلیکشن",
          cover_image: null,
          cover_image_url: null,
          download_url: null,
          status: "pending",
          updated_on: null,
          type_id: 4,
        },
        {
          book_id: 8,
          book_name_ar: "تعویذ کا شرک",
          book_name_en: "Taweez Ka Shirk",
          book_name_ur: "تعویذ کا شرک",
          cover_image: null,
          cover_image_url: null,
          download_url: "http://taweezkashirk.pdf",
          status: "pending",
          updated_on: null,
          type_id: 5,
        },
        {
          book_id: 9,
          book_name_ar: "وسیلہ کا شرک",
          book_name_en: "Waseelay Ka Shirk",
          book_name_ur: "وسیلہ کا شرک",
          cover_image: null,
          cover_image_url: null,
          download_url: "http://waseelayKaShirk.pdf",
          status: "pending",
          updated_on: null,
          type_id: 5,
        },
        {
          book_id: 10,
          book_name_ar: "صلوٰۃ",
          book_name_en: "Salat",
          book_name_ur: "نماز",
          cover_image: null,
          cover_image_url: null,
          download_url: "http://salat.pdf",
          status: "pending",
          updated_on: null,
          type_id: 5,
        },
        {
          book_id: 11,
          book_name_ar: "حج و عمرہ",
          book_name_en: "Hajj & Umra",
          book_name_ur: "حج و عمرہ",
          cover_image: null,
          cover_image_url: null,
          download_url: "http://hajjUmra.pdf",
          status: "pending",
          updated_on: null,
          type_id: 5,
        },
        {
          book_id: 12,
          book_name_ar: "مسنون دعا",
          book_name_en: "Masnoon Dua",
          book_name_ur: "مسنون دعا",
          cover_image: null,
          cover_image_url: null,
          download_url: "http://masnoondua.pdf",
          status: "pending",
          updated_on: null,
          type_id: 5,
        },
      ],
      { ignoreDuplicates: true }
    );
    console.log("✅ Book data inserted");

    // Insert Chapter data
    await Chapter.bulkCreate(
      [
        {
          chapter_id: 1,
          book_id: 7,
          chapter_name_ar: "الفصل 1",
          chapter_name_en: "Chapter 1",
          chapter_name_ur: "باب 1",
          page_no: null,
          download_url: null,
          status: "pending",
          category_name: "Audio Chapter",
        },
      ],
      { ignoreDuplicates: true }
    );
    console.log("✅ Chapter data inserted");

    // Insert Verse data
    const verses = [];
    for (let i = 1; i <= 15; i++) {
      verses.push({
        chapter_id: 1,
        book_id: 7,
        verse_no: i,
        text_ar: "Dars on Shirk",
        text_en: "Dars on Shirk",
        text_ur: "Dars on Shirk",
        audio_url: `https://theemanekhalis/audiofile${i}.mp3`,
      });
    }

    await Verse.bulkCreate(verses, { ignoreDuplicates: true });
    console.log("✅ Verse data inserted");

    console.log("\n🎉 Database seeding completed!");
  } catch (error) {
    console.error("❌ Error seeding database:", error);
    throw error;
  }
}

module.exports = seedDatabase;



