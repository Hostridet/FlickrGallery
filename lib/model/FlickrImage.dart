
import 'package:flicker/data/entity/FlickrImageEntity.dart';

class FlickrImage {
  final String id;
  final String title;
  final String secret;
  final String server;
  final int farm;

  FlickrImage({
    required this.id,
    required this.title,
    required this.secret,
    required this.server,
    required this.farm
  });

  factory FlickrImage.fromJson(Map<String, dynamic> json) {
    return FlickrImage(
      id: json['id'] as String,
      title: json['title'] as String,
      secret: json['secret'] as String,
      server: json['server'] as String,
      farm: json['farm'] as int
    );
  }

  factory FlickrImage.fromEntity(FlickrImageEntity entity) {
    return FlickrImage(
        id: entity.id,
        title: entity.title,
        secret: entity.secret,
        server: entity.server,
        farm: entity.farm
    );
  }
}