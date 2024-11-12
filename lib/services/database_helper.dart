import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/book.dart';

class DatabaseHelper {
  static final _databaseName = "book_library.db";
  static final _databaseVersion = 1;

  static final table = 'books';

  static final columnId = '_id';
  static final columnTitle = 'title';
  static final columnAuthor = 'author';
  static final columnRating = 'rating';
  static final columnRead = 'read';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnTitle TEXT NOT NULL,
        $columnAuthor TEXT NOT NULL,
        $columnRating INTEGER NOT NULL,
        $columnRead INTEGER NOT NULL
      )
    ''');
  }

  Future<int> insert(Book book) async {
    Database db = await database;
    return await db.insert(table, book.toMap());
  }

  Future<List<Book>> queryAllBooks() async {
    Database db = await database;
    final maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return Book.fromMap(maps[i]);
    });
  }

  Future<int> update(Book book) async {
    Database db = await database;
    return await db.update(
      table,
      book.toMap(),
      where: '$columnId = ?',
      whereArgs: [book.id],
    );
  }

  Future<int> delete(int id) async {
    Database db = await database;
    return await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
