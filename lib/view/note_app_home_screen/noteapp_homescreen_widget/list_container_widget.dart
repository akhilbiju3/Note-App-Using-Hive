import 'package:flutter/material.dart';
import 'package:noteapphive/controller/note_screen_controller/note_screen_controller.dart';

class ListContainer extends StatefulWidget {
  final String? listTitle;
  final String? listDescription;
  final String? listDate;
  final int listColorIndex;
  final void Function()? onDeletePressed;
  const ListContainer(
      {super.key,
      required this.listTitle,
      required this.listDescription,
      required this.listDate,
      this.listColorIndex = 0, this.onDeletePressed});

  @override
  State<ListContainer> createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color.fromARGB(255, 164, 176, 248),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  widget.listTitle ?? "",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.delete, size: 30),
                    onPressed: widget.onDeletePressed,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.listDescription ?? "",
            maxLines: 3,
            overflow: TextOverflow.clip,
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.listDate ?? "",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
