import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../model/FlickrImage.dart';

class ImageView extends StatelessWidget {
  final FlickrImage flickrImage;
  ImageView({Key? key, required this.flickrImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("/view", arguments: flickrImage);
        },
        child: CachedNetworkImage(
          imageUrl: "https://live.staticflickr.com/${flickrImage.server}/${flickrImage.id}_${flickrImage.secret}.jpg",
          placeholder: (context, url) => Container(decoration: BoxDecoration(color: Colors.white54)),
          errorWidget: (context, url, error) => Container(decoration: BoxDecoration(color: Colors.white54), child: Icon(Icons.error)),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
