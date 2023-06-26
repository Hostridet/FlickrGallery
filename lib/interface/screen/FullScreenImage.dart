import 'package:flicker/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:flicker/config.dart';
import 'package:flicker/interface/component/InfoSnackBar.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flicker/model/FlickrImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatefulWidget {
  final FlickrImage flickrImage;
  FullScreenImage({Key? key, required this.flickrImage}) : super(key: key);

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  FavouriteBloc favouriteBloc = FavouriteBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => favouriteBloc,
      child: BlocListener<FavouriteBloc, FavouriteState>(
        listener: (context, state) {
          if (state is FavouriteMessageState) {
            InfoSnackBar.buildErrorLayout(context, state.message);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    favouriteBloc.add(FavouriteUpgradeEvent(widget.flickrImage));
                  },
                  icon: Icon(Icons.star),
              ),
            ],
          ),
          body: PhotoView(
            imageProvider: NetworkImage("${Config.imageUrl}${widget.flickrImage.server}/${widget.flickrImage.id}_${widget.flickrImage.secret}_b.jpg"),
          ),
        ),
      ),
    );
  }
}
