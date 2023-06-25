import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../bloc/search_bloc/search_bloc.dart';
import '../../model/FlickrImage.dart';

class ViewAppBar extends AppBar {
  final BuildContext context;
  final String text;
  final Icon icon;
  final int axisCount;
  List<FlickrImage> flickrImages;

  ViewAppBar({Key? key, required this.context, required this.text, required this.axisCount, required this.icon, required this.flickrImages}):super(
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
          onPressed: () {},
          icon: Icon(Icons.star)
      ),
      IconButton(
          onPressed: () {
            BlocProvider.of<SearchBloc>(context)
                .add(SetAxisCount(text, flickrImages, axisCount));
          },
          icon: icon
      ),
    ],
  );
}