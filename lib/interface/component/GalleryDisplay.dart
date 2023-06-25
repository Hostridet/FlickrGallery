import 'package:flicker/bloc/display_bloc/display_bloc.dart';
import 'package:flicker/interface/component/BackLogo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GalleryDisplay extends StatefulWidget {
  final String title;
  final int axisCount;
  GalleryDisplay({Key? key, required this.axisCount, required this.title}) : super(key: key);

  @override
  State<GalleryDisplay> createState() => _GalleryDisplayState();
}

class _GalleryDisplayState extends State<GalleryDisplay> {
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
              itemCount: state.flickrImages.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.axisCount,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: CachedNetworkImage(
                    imageUrl: "https://live.staticflickr.com/${state.flickrImages[index].server}/${state.flickrImages[index].id}_${state.flickrImages[index].secret}.jpg",
                    placeholder: (context, url) => Container(decoration: BoxDecoration(color: Colors.white54)),
                    errorWidget: (context, url, error) => Container(decoration: BoxDecoration(color: Colors.white54), child: Icon(Icons.error)),
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
