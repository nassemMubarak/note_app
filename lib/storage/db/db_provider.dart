import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  late final Database _database;

  DBProvider._internal();

  static final DBProvider _instance = DBProvider._internal();

  factory DBProvider() {
    return _instance;
  }

  Database get database => _database;

  Future<void> initDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'app_database.sql');
    _database =await  openDatabase(
        path,
        version:1,
        onOpen: (Database db){},
        onCreate: (Database db, int version){
          db.execute('CREATE TABLE notes ('
              'id INTEGER PRIMARY KEY AUTOINCREMENT,'
              'title TEXT,'
              'image Text,'
              'dateTime TEXT,'
              'contain TEXT'
              ')');
        },
        onUpgrade: (Database db, int oldVersion, int newVersion){},
        onDowngrade: (Database db, int oldVersion, int newVersion){}
    );
  }
}
