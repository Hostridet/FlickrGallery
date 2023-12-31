import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../bloc/display_bloc/display_bloc.dart';
import '../../bloc/search_bloc/search_bloc.dart';
import '../../model/FlickrImage.dart';

class SearchAppBar extends AppBar {
  final BuildContext context;
  final TextEditingController inputController;
  final int axisCount;

  SearchAppBar({Key? key, required this.context, required this.inputController, required this.axisCount}):super(
    automaticallyImplyLeading: false,
      title: Container(
        height: 35,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        child: TextField(
          onChanged: (String? value) {
            BlocProvider.of<DisplayBloc>(context)
                .add(DisplayGetEvent(value!));
            BlocProvider.of<SearchBloc>(context)
                .add(SetSearchAppBar(value));
          },
          style: TextStyle(
            fontSize: 20,
          ),
          controller: inputController,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                BlocProvider.of<SearchBloc>(context)
                    .add(SetViewAppBar(inputController.text, axisCount));
                inputController.clear();
              },
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                inputController.clear();
                BlocProvider.of<SearchBloc>(context)
                    .add(SetSearchAppBar(""));
              },
            ),
          ),
        ),
      )
  );
}