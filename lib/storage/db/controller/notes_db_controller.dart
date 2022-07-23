import 'package:note_app/model/notes.dart';
import 'package:note_app/storage/db/db_provider.dart';
import 'package:note_app/storage/db/dp_operations.dart';
import 'package:sqflite/sqflite.dart';

class NotesDbController extends DBOperations<Notes> {
  Database _database;

  NotesDbController() : _database = DBProvider().database;

  @override
  Future<int> create(Notes data) async {
    return await _database.insert(Notes.tableName, data.toMap());
  }

  @override
  Future<bool> delete(int id) async {
    int countDelete =
        await _database.delete(Notes.tableName, where: 'id=?', whereArgs: [id]);
    return countDelete != 0;
  }

  @override
  Future<List<Notes>> read() async {
    var data = await _database.query(Notes.tableName);
    return data.map((rowMap) => Notes.fromMap(rowMap)).toList();
  }

  @override
  Future<Notes?> show(int id) async {
    var data = await _database
        .query(Notes.tableName, where: 'id = ?', whereArgs: [id]);
    return data.map((rowMap) => Notes.fromMap(rowMap)).toList().first;
  }

  @override
  Future<bool> update(Notes data,int id) async {
    int countUpdate = await _database.update(Notes.tableName, data.toMap(),
        where: 'id = ?', whereArgs: [id]);
    return countUpdate != 0;
  }
}
