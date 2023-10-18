
import 'package:hive/hive.dart';
part 'note_model_class.g.dart';


@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String date;
  @HiveField(3)
   int? selectedColor;

  NoteModel(
      {required this.title, required this.description, required this.date,required this.selectedColor});
}
