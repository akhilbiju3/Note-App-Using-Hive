import 'package:hive_flutter/hive_flutter.dart';
import 'package:noteapphive/model/note_model_class/note_model_class.dart';

class NoteScreenController {
  List<NoteModel> notes = [];
  final myData = Hive.box('NoteAppDB');

  void addNotes(NoteModel note) {
    notes.add(note);
    updateDatabase();
  }

  void deleteNotes(int index) {
    notes.removeAt(index);
    updateDatabase();
  }

  //Load Data From the Databse
   loadDatabase() async {
    notes = await myData.get('noteDataList');
  }

  //Update the Database
  void updateDatabase() {
    myData.put('noteDataList', notes);
  }
}
