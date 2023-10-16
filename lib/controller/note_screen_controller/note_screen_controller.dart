import 'package:noteapphive/model/note_model_class/note_model_class.dart';

class NoteScreenController{
  List<NoteModel> notes = [];

  void addNotes(NoteModel note){
    notes.add(note);
  }

  void deleteNotes(int index){
    notes.removeAt(index);
  }

}