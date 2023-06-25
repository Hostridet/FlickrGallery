

import 'package:flutter/cupertino.dart';

import '../../model/FlickrImage.dart';

class GalleryDisplay extends StatefulWidget {
  final List<FlickrImage> flickrImages;
  final int axisCount;
  GalleryDisplay({Key? key, required this.flickrImages, required this.axisCount}) : super(key: key);

  @override
  State<GalleryDisplay> createState() => _GalleryDisplayState();
}

class _GalleryDisplayState extends State<GalleryDisplay> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.flickrImages.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.axisCount,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: Image.network(
              'https://live.staticflickr.com/${widget.flickrImages[index].server}/${widget.flickrImages[index].id}_${widget.flickrImages[index].secret}.jpg',
              fit: BoxFit.fill
          ),
        );
      },
    );
  }
}
