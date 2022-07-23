import 'package:flutter/material.dart';
import 'package:note_app/storage/db/controller/notes_db_controller.dart';
import '../model/notes.dart';

class NotesChangeNotifier extends ChangeNotifier {
  List<Notes> notes = [];

  NotesChangeNotifier() {
    read();
  }

  Future<void> read() async {
    notes = await NotesDbController().read();
    notifyListeners();
  }
  Future<bool> create(Notes data) async{
    int id = await NotesDbController().create(data);
    if(id!=0){
      data.id = id;
      notes.add(data);
      notifyListeners();
    }
    return id!=0;
  }
  Future<bool> delete(int id,int index)async{
    bool de = await NotesDbController().delete(id);
    if(de){
      notes.removeAt(index);
      notifyListeners();
    }
    return true;
  }
  Future<bool> update(Notes data) async{
    bool update = await NotesDbController().update(data,data.id);
    if(update){
      int index =  notes.indexWhere((notes) => notes.id == data.id);
      notes[index]=data;
      notifyListeners();
    }
    return update;
  }

}
