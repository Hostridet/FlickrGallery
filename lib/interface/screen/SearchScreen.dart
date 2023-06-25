import 'package:flicker/interface/component/ViewAppBar.dart';
import 'package:flicker/interface/component/SearchAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/search_bloc/search_bloc.dart';
import '../component/GalleryDisplay.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController inputController = TextEditingController();
  Map<int, Icon> mapIcons = {
    1: Icon(Icons.view_stream),
    2: Icon(Icons.grid_view),
    4: Icon(Icons.view_comfy),
  };
  int axisCount = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc()..add(SetSearchAppBar("")),
      child: BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchAppBarState) {
          return Scaffold(
            appBar: SearchAppBar(
              flickrImages: state.flickrImages,
              context: context,
              inputController: inputController,
              axisCount: axisCount,
            ),
            body: GalleryDisplay(
              flickrImages: state.flickrImages,
              axisCount: axisCount,
            ),
          );
        }
        if (state is ViewAppBarState) {
          axisCount = state.axisCount;
          return Scaffold(
            appBar: ViewAppBar(
              flickrImages: state.flickrImages,
              context:  context,
              text: state.title,
              icon: mapIcons[state.axisCount]!,
              axisCount: state.axisCount,
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                return BlocProvider.of<SearchBloc>(context)
                    .add(UpdateImageEvent(state.title, state.axisCount));
              },
              child: GalleryDisplay(
                flickrImages: state.flickrImages,
                axisCount: state.axisCount,
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(),
        );
      },
    ),
    );
  }
}
