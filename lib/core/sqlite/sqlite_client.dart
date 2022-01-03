import 'package:home_automation_control/core/exceptions/exception_handling.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../app_log.dart';

class SQLiteClient {
  Future<Database> initializeDB() async {
    final String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'homeAutomation.db'),
      onCreate: (database, version) async {
        await database.execute('''
        CREATE TABLE users(
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          username TEXT NOT NULL,
          email TEXT,
          password TEXT
        )
        ''');
      },
      version: 1,
    );
  }

  Future<Map<String, dynamic>> get(Map<String, dynamic> body) async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('users');
    for (final val in queryResult) {
      Log.d('val: $val');
      Log.d('body: $body');
      Log.d('username: ${val['username'] == body['username']}');
      Log.d('password: ${val['password'] == body['password']}');
      if (val['username'] == body['username'] &&
          val['password'] == body['password']) {
        return val;
      }
    }
    throw SQLiteException("User doesn\'t exists");
  }

  Future<Map<String, dynamic>> post(Map<String, dynamic> body) async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('users');
    for (final val in queryResult) {
      if (val['username'] == body['username']) {
        throw SQLiteException('User already exists');
      }
    }
    await db.insert('users', body);
    return get(body);
  }
}
