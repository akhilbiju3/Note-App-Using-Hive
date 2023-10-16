import 'package:flutter/material.dart';
import 'package:noteapphive/view/note_app_home_screen/noteapp_homescreen.dart';

void main() {
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
