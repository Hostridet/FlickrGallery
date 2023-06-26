import 'package:flicker/bloc/display_bloc/display_bloc.dart';
import 'package:flicker/interface/component/BackLogo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../model/FlickrImage.dart';
import 'ImageView.dart';

class GalleryDisplay extends StatefulWidget {
  final String title;
  final int axisCount;
  GalleryDisplay({Key? key, required this.axisCount, required this.title}) : super(key: key);

  @override
  State<GalleryDisplay> createState() => _GalleryDisplayState();
}

class _GalleryDisplayState extends State<GalleryDisplay> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        BlocProvider.of<DisplayBloc>(context)
              .add(DisplayPaginateEvent(widget.title));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayBloc, DisplayState>(
      builder: (context, state) {
        if (state is DisplayLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is DisplayErrorState) {
          return Center(
            child: BackLogo(
                textWidget: Text(
                    state.error,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                  ),
                ),
            ),
          );
        }
        if (state is DisplayLoadedState) {
          return RefreshIndicator(
            onRefresh: () async {
              return BlocProvider.of<DisplayBloc>(context)
                  .add(DisplayGetEvent(widget.title));
            },
            child: GridView.builder(
              controller: scrollController,
              itemCount: state.flickrImages.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.axisCount,
              ),
              itemBuilder: (context, index) {
                return ImageView(flickrImage: state.flickrImages[index]);
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
