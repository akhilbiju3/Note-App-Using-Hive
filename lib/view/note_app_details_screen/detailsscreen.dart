import 'package:flutter/material.dart';
import 'package:noteapphive/utils/color_constants/colors.dart';

class DetailsScreen extends StatefulWidget {
  final String detailsTitle;
  final String detailsDescription;
  final String detailsDate;
  const DetailsScreen(
      {super.key,
      required this.detailsTitle,
      required this.detailsDescription,
      required this.detailsDate});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xfff252525),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            widget.detailsTitle,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0, top: 15.0),
                child: Text(
                  widget.detailsDate,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.detailsDescription,
                style: TextStyle(color: Colors.white, fontSize: 16)),
          )
        ],
      ),
    );
  }
}
