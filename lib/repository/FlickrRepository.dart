import 'dart:convert';

import 'package:flicker/config.dart';
import 'package:flicker/model/FlickrImage.dart';
import 'package:http/http.dart' as http;

class FlickRepository {
  Future<List<FlickrImage>> searchPhotos(String title, int page, int perPage) async {
    List<FlickrImage> flickrImages = [];
    final response = await http.get(Uri.parse("${Config.baseUrl}?"
        "name=value&api_key=${Config.token}&"
        "text=$title&"
        "method=flickr.photos.search&"
        "format=json&nojsoncallback=1&"
        "page=$page"
        "&per_page=$perPage"));
    if (response.statusCode == 200) {
      final data = await json.decode(utf8.decode(response.bodyBytes));
      flickrImages.addAll((data['photos']['photo'] as List<dynamic>)
          .map((item) => FlickrImage.fromJson(item)));
    }
    return flickrImages;

  }
}