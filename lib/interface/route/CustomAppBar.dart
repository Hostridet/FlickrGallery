
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final String text;

  CustomAppBar({Key? key, required this.text}):super(
    title: Text(text),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(Icons.search)
      ),
      IconButton(
          onPressed: () {},
          icon: Icon(Icons.view_agenda)
      ),
    ],
  );
}