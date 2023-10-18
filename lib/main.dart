import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noteapphive/model/note_model_class/note_model_class.dart';
import 'package:noteapphive/view/note_app_home_screen/noteapp_homescreen.dart';

Future<void> main() async {
  // Initialize Hive
  await Hive.initFlutter();

  // open the box
  var box = await Hive.openBox('NoteAppDB');

  // Register the NoteModel Adapter
  
    Hive.registerAdapter(NoteModelAdapter());
  
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NoteHomeScreen(),
    );
  }
}
