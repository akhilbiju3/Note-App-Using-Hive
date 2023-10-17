import 'package:flutter/material.dart';
import 'package:noteapphive/controller/note_screen_controller/note_screen_controller.dart';
import 'package:noteapphive/model/note_model_class/note_model_class.dart';
import 'package:noteapphive/utils/color_constants/colors.dart';
import 'package:noteapphive/view/note_app_home_screen/noteapp_homescreen_widget/list_container_widget.dart';

class NoteHomeScreen extends StatefulWidget {
  const NoteHomeScreen({super.key});

  @override
  State<NoteHomeScreen> createState() => _NoteHomeScreenState();
}

class _NoteHomeScreenState extends State<NoteHomeScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  NoteScreenController noteController = NoteScreenController();
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Note App'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (context, index) => ListContainer(
                listTitle: noteController.notes[index].title,
                listDescription: noteController.notes[index].description,
                listDate: noteController.notes[index].date,
                listColorIndex: noteController.notes[index].color,
                onDeletePressed: () {
                  noteController.deleteNotes(index);
                  setState(() {});
                }),
            separatorBuilder: (context, index) => Divider(),
            itemCount: noteController.notes.length),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          BottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> BottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
          height: 600,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    width: double.infinity,
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          labelText: 'Title',
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  child: TextField(
                    controller: descriptionController,
                    maxLines: 5,
                    decoration: InputDecoration(
                        labelText: 'Description',
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                        hintText: 'Date',
                        labelText: 'Date',
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mycolorList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          height: 20,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color: selectedIndex == index
                                    ? Colors.black
                                    : Colors.transparent),
                            color: mycolorList[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo),
                      onPressed: () {
                        noteController.addNotes(NoteModel(
                            title: titleController.text,
                            description: descriptionController.text,
                            date: dateController.text,
                            color: selectedIndex ?? 0
                          ));
                        setState(() {});
                        Navigator.pop(context);
                      },
                      child: Text('Add Note'),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
