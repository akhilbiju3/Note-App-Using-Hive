import 'package:flutter/material.dart';
import 'package:noteapphive/controller/note_screen_controller/note_screen_controller.dart';
import 'package:noteapphive/model/note_model_class/note_model_class.dart';
import 'package:noteapphive/utils/color_constants/colors.dart';
import 'package:noteapphive/view/note_app_details_screen/detailsscreen.dart';
import 'package:noteapphive/view/note_app_home_screen/noteapp_homescreen_widget/list_container_widget.dart';

class NoteHomeScreen extends StatefulWidget {
  const NoteHomeScreen({super.key});

  @override
  State<NoteHomeScreen> createState() => _NoteHomeScreenState();
}

class _NoteHomeScreenState extends State<NoteHomeScreen> {
  @override
  void initState() {
    loadDatabaseData();
    super.initState();
  }

  loadDatabaseData() async {
    NoteScreenController noteController = NoteScreenController();
    await noteController.loadDatabase();
  }

  // TextEditingController for the title,description and date
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  //object creation for the note screen controller class
  NoteScreenController noteController = NoteScreenController();

  //set initial idex of color as zero
  int? selectedIndex;

  DateTime? selectedDate;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    setState(() {
      selectedDate = selected;
      // converting the selected date to string and parse to datetime format 
      var date = DateTime.parse(selectedDate.toString());
      // formatting the date to dd-mm-yyyy format
      var formattedDate = "${date.day}-${date.month}-${date.year}";
      // setting the formatted date to the date controller
      dateController.text = formattedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Note App'),
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                            detailsTitle: titleController.text,
                            detailsDescription: descriptionController.text,
                            detailsDate: dateController.text)));
                  },
                  child: ListContainer(
                    listTitle: noteController.notes[index].title,
                    listDescription: noteController.notes[index].description,
                    listDate: noteController.notes[index].date,
                    listColorIndex: noteController.notes[index].selectedColor!,
                    onDeletePressed: () {
                      noteController.deleteNotes(index);
                      setState(() {});
                    },
                    shareText: noteController.notes[index].title,
                  ),
                ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: noteController.notes.length),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          BottomSheet(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  Future<dynamic> BottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, floatSetState) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Container(
                      child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
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
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
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
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: dateController,
                          decoration: InputDecoration(
                              hintText: 'Date',
                              labelText: 'Date',
                              suffixIcon: InkWell(
                                  onTap: () {
                                    selectDate(context);
                                  },
                                  child: Icon(Icons.calendar_today)),
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              )),
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
                                  floatSetState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  height: 20,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
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
                                    selectedColor: selectedIndex ?? 0));
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
                ),
              );
            },
          );
        });
  }
}
