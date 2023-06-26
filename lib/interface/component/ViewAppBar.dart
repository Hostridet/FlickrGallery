import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../bloc/search_bloc/search_bloc.dart';

class ViewAppBar extends AppBar {
  final BuildContext context;
  final String text;
  final Icon icon;
  final int axisCount;

  ViewAppBar({Key? key, required this.context, required this.text, required this.axisCount, required this.icon}):super(
    title: Text(text.isEmpty ? "Не выбрано" : text),
    actions: [
      IconButton(
          onPressed: () {
            BlocProvider.of<SearchBloc>(context)
                .add(SetSearchAppBar(""));
          },
          icon: Icon(Icons.search)
      ),
      IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/favourite", arguments: axisCount);
          },
          icon: Icon(Icons.star)
      ),
      IconButton(
          onPressed: () {
            BlocProvider.of<SearchBloc>(context)
                .add(SetAxisCount(text, axisCount));
          },
          icon: icon
      ),
    ],
  );
}