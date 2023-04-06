import 'package:first_project/model/contact_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  final String _tableName = 'contacts';

  Future<Database> _initializeDb() async {
    final Future<Database> db = openDatabase(
      join(await getDatabasesPath(), 'contact_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName(
            id TEXT PRIMARY KEY,
            name TEXT,
            phoneNumber TEXT,
            pickedDate TEXT,
            pickedTime TEXT,
            pickedColor TEXT,
            filePath TEXT
        )''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<List<ContactModel>> getContacts() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((e) => ContactModel.fromMap(e)).toList();
  }

  Future<bool> isContact(String id) async {
    List<ContactModel> list = await getContacts();
    int index = list.indexWhere((element) => element.id == id);
    if (index != -1) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> insertContact(ContactModel query) async {
    final Database db = await database;
    await db.insert(_tableName, query.toMap());
  }

  Future<void> updateContact(ContactModel query) async {
    final Database db = await database;
    await db.update(
      _tableName,
      query.toMap(),
      where: 'id = ?',
      whereArgs: [query.id],
    );
  }

  Future<void> deleteContact(String id) async {
    final Database db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
