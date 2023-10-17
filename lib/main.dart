import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noteapphive/view/note_app_home_screen/noteapp_homescreen.dart';

Future<void> main() async {
  var box = await Hive.openBox('NoteAppDB');
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
