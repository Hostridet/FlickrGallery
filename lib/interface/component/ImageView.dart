import 'package:flicker/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../model/FlickrImage.dart';

class ImageView extends StatelessWidget {
  final FlickrImage flickrImage;
  final int axisCount;

  Map<int, String> imageSize = {
    1: "b",
    2: "z",
    4: "q"
  };

  ImageView({Key? key, required this.flickrImage, required this.axisCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("/view", arguments: flickrImage);
        },
        child: CachedNetworkImage(
          imageUrl: "${Config.imageUrl}${flickrImage.server}/${flickrImage.id}_${flickrImage.secret}_${imageSize[axisCount]}.jpg",
          placeholder: (context, url) => Container(decoration: BoxDecoration(color: Colors.white54)),
          errorWidget: (context, url, error) => Container(decoration: BoxDecoration(color: Colors.white54), child: Icon(Icons.error)),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
