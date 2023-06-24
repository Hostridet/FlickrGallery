
import 'package:flutter/material.dart';

class SearchAppBar extends AppBar {
  final BuildContext context;
  final TextEditingController inputController;

  SearchAppBar({Key? key, required this.context, required this.inputController}):super(
    automaticallyImplyLeading: false,
      title: Container(
        height: 35,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        child: TextField(
          style: TextStyle(
            fontSize: 20,
          ),
          controller: inputController,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.arrow_back),
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                inputController.clear();
              },
            ),
          ),
        ),
      )
  );
}