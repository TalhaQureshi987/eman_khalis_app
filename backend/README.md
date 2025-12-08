# Eman Khalis Backend API

Backend API built with Express.js, Sequelize ORM, and SQLite database.

## 📁 Project Structure

```
backend/
├── config/
│   └── database.js          # Sequelize database configuration
├── controllers/
│   ├── bookController.js    # Book CRUD operations
│   ├── chapterController.js # Chapter CRUD operations
│   ├── verseController.js   # Verse CRUD operations
│   └── typeController.js    # Type operations
├── models/
│   ├── Type.js              # Type model
│   ├── Book.js              # Book model
│   ├── Chapter.js           # Chapter model
│   ├── Verse.js             # Verse model
│   └── index.js             # Model associations
├── routes/
│   ├── bookRoutes.js        # Book routes
│   ├── chapterRoutes.js     # Chapter routes
│   ├── verseRoutes.js       # Verse routes
│   ├── typeRoutes.js        # Type routes
│   └── index.js             # Main routes
├── seeders/
│   └── seedData.js          # Initial data seeding
├── database.sqlite          # SQLite database file (auto-generated)
├── index.js                 # Express server
├── init-db.js               # Database initialization script
└── package.json
```

## 🚀 Getting Started

### 1. Install Dependencies

```bash
npm install
```

### 2. Initialize Database

```bash
npm run init-db
```

This will:
- Create the SQLite database file
- Create all tables (Type, Book, Chapter, Verse)
- Insert initial data

### 3. Start Server

```bash
# Development mode (with nodemon)
npm run dev

# Production mode
npm start
```

Server will run on `http://localhost:3000`

## 📚 API Endpoints

### Base URL: `http://localhost:3000/api`

#### Books
- `GET /api/books` - Get all books
- `GET /api/books/:id` - Get book by ID
- `GET /api/books/type/:typeId` - Get books by type
- `POST /api/books` - Create new book
- `PUT /api/books/:id` - Update book
- `DELETE /api/books/:id` - Delete book

#### Chapters
- `GET /api/chapters` - Get all chapters
- `GET /api/chapters/:id` - Get chapter by ID
- `GET /api/chapters/book/:bookId` - Get chapters by book ID
- `POST /api/chapters` - Create new chapter
- `PUT /api/chapters/:id` - Update chapter
- `DELETE /api/chapters/:id` - Delete chapter

#### Verses
- `GET /api/verses` - Get all verses
- `GET /api/verses/:id` - Get verse by ID
- `GET /api/verses/chapter/:chapterId` - Get verses by chapter ID
- `GET /api/verses/book/:bookId` - Get verses by book ID
- `POST /api/verses` - Create new verse
- `PUT /api/verses/:id` - Update verse
- `DELETE /api/verses/:id` - Delete verse

#### Types
- `GET /api/types` - Get all types
- `GET /api/types/:id` - Get type by ID

## 📝 Example API Calls

### Get all books
```bash
curl http://localhost:3000/api/books
```

### Get book with chapters
```bash
curl http://localhost:3000/api/books/7
```

### Get verses by chapter
```bash
curl http://localhost:3000/api/verses/chapter/1
```

### Create a new book
```bash
curl -X POST http://localhost:3000/api/books \
  -H "Content-Type: application/json" \
  -d '{
    "book_id": 13,
    "book_name_en": "New Book",
    "book_name_ar": "كتاب جديد",
    "book_name_ur": "نیا کتاب",
    "type_id": 1
  }'
```

## 🗄️ Database Schema

### Type Table
- `type_id` (Primary Key)
- `type_name`

### Book Table
- `book_id` (Primary Key)
- `book_name_ar`, `book_name_en`, `book_name_ur`
- `cover_image`, `cover_image_url`, `download_url`
- `status`, `updated_on`
- `type_id` (Foreign Key → Type)

### Chapter Table
- `chapter_id` (Primary Key)
- `book_id` (Foreign Key → Book)
- `chapter_name_ar`, `chapter_name_en`, `chapter_name_ur`
- `page_no`, `download_url`, `status`, `category_name`

### Verse Table
- `id` (Primary Key)
- `chapter_id` (Foreign Key → Chapter)
- `book_id` (Foreign Key → Book)
- `verse_no`
- `text_ar`, `text_en`, `text_ur`
- `audio_url`

## 🛠️ Technologies Used

- **Express.js** - Web framework
- **Sequelize** - ORM for database operations
- **SQLite3** - Database
- **CORS** - Cross-origin resource sharing

## 📦 Dependencies

- express
- sequelize
- sqlite3
- cors
- nodemon (dev)



