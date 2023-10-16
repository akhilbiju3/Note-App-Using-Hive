import 'package:flutter/material.dart';
import 'package:noteapphive/view/note_app_home_screen/noteapp_homescreen_widget/list_container_widget.dart';

class NoteHomeScreen extends StatefulWidget {
  const NoteHomeScreen({super.key});

  @override
  State<NoteHomeScreen> createState() => _NoteHomeScreenState();
}

class _NoteHomeScreenState extends State<NoteHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Note App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (context, index) => ListContainer(),
            separatorBuilder: (context, index) => Divider(),
            itemCount: 3),
      ),
    );
  }
}
