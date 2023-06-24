import 'dart:convert';

import 'package:flicker/model/FlickrImage.dart';
import 'package:http/http.dart' as http;

class FlickRepository {
  Future<List<FlickrImage>> searchPhotos(String title, int page, int perPage) async {
    List<FlickrImage> flickrImages = [];
    final response = await http.get(Uri.parse("https://www.flickr.com/services/rest/?name=value&api_key=1a932b8162f54cdfaafc0c70315aa221&text=$title&method=flickr.photos.search&format=json&nojsoncallback=1&page=1&per_page=40"));
    if (response.statusCode == 200) {
      final data = await json.decode(utf8.decode(response.bodyBytes));
      for (dynamic item in data['photos']['photo']) {
        flickrImages.add(FlickrImage.fromJson(item));
      }
    }
    return flickrImages;

  }
}