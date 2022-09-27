import 'package:flite/screens/models/student.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _db;
  static const String _tablename = "student";
  static const String _tableadmin = "Admin";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }

    try {
      String databasePath = await getDatabasesPath();
      String path = join(databasePath, "mydb.db");

      _db = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE $_tablename (id INTEGER PRIMARY KEY AUTOINCREMENT,rollno TEXT, name TEXT, password TEXT)');
      });
    } catch (e) {}
  }

  static Future<void> insertIntoDb(StudentModel std) async {
    try {
      int row = await _db!.insert(_tablename, std.toJson());
      print("Insert function is called");
      print("Row: $row");
    } catch (e) {
      print("Insert function is called");
      print(e);
    }
  }

  static Future<List<Map<String, Object?>>?> showData() async {
    return await _db?.query(_tablename);
  }

  static Future<List<Map<String, dynamic>>> searchForStudent(
      String name) async {
    print("searching....");
    List<Map<String, dynamic>> result =
        await _db!.rawQuery('SELECT * FROM $_tablename WHERE name=?', [name]);
    return result;
  }

  static Future<int> updateStudent(String name, String rollno) async {
    return await _db!.rawUpdate(
        '''update $_tablename set rollno =? where name =?''', [rollno, name]);
  }
}
