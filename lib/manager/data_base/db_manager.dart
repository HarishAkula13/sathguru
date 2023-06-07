import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import '../../common/logger/logger.dart';
import '../../model/login/login_response.dart';

class DbManager {
  static Database? _db;
  UserModel? _user;
  static const String DB_Name = 'test.db';
  static const String Table_User = 'user';
  static const int Version = 1;

  static const String C_UserID = 'user_id';
  static const String C_UserName = 'user_name';
  static const String C_Email = 'email';
  static const String C_Password = 'password';
  static const String C_dob = 'dob';
  static const String C_address = 'address';
  static const String C_salary = 'salary';

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_User ("
        " $C_UserID TEXT, "
        " $C_UserName TEXT, "
        " $C_Email TEXT,"
        " $C_Password TEXT, "
        " $C_dob TEXT, "
        " $C_address TEXT, "
        " $C_salary TEXT, "
        " PRIMARY KEY ($C_UserID)"
        ")");
  }

  Future<int> saveData(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_User, user.toJson());
    return res;
  }
  Future<UserModel?> getLoginUser(String userId, String password) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_UserID = '$userId' AND "
        "$C_Password = '$password'");

    if (res.length > 0) {
      return UserModel.fromJson(res.first);
    }

    return null;
  }
  Future<int> insert<T>(Map<String, dynamic> row) async {
    printLog("SQLFLITE:: data insert : ",row);
    final db = await _db;

    final result = db!.insert(T.toString(), row);

    result.catchError((e) {
      printLog("SQLFLITE:: Error on insert", e.toString());
    });

    return result;
  }

  Future<List<Map<String, dynamic>>> queryAllRows<T>() async {
    Database? db = await _db;

    final result = db!.query(T.toString());

    result.catchError((e) {
      printLog("SQLFLITE:: Error on query", e.toString());
    });

    return result;
  }

  Future<int> update<T>(Map<String, dynamic> row) async {
    print("data update:$row");
    Database? db = await _db;
    String usersid = row['user_id'].toString();

    final result =
    db!.update(T.toString(), row, where: '$usersid = ?', whereArgs: [usersid]);

    result.catchError((e) {
      printLog("SQLFLITE:: Error on update", e.toString());
    });

    return result;
  }

  Future<int> delete<T>() async {
    final db = await _db;

    final result = db!.delete(T.toString());

    result.catchError((e) {
      printLog("SQLFLITE:: Error on delete all", e.toString());
    });

    return result;
  }
}