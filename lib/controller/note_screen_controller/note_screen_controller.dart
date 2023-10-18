import 'package:hive_flutter/hive_flutter.dart';
import 'package:noteapphive/model/note_model_class/note_model_class.dart';
import 'package:share_plus/share_plus.dart';

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

  void shareNotes(String shareText) {
    Share.share(shareText);
    updateDatabase();
  }

  //Load Data From the Databse
  loadDatabase() async {
    // data in the database is in dynamic form so convert it to list for diplaying while loading from the database
    final List dbData = myData.get('noteDataList') ?? [];
    notes = dbData
        .map((e) => NoteModel(
            title: e.title,
            description: e.description,
            date: e.date,
            selectedColor: e.selectedColor))
        .toList();
  }

  //Update the Database
  void updateDatabase() {
    myData.put('noteDataList', notes);
  }
}
