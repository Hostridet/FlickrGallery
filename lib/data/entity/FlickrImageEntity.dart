import 'package:flicker/model/FlickrImage.dart';
import 'package:floor/floor.dart';

@entity
class FlickrImageEntity {
  @primaryKey
  final String id;
  final String title;
  final String secret;
  final String server;
  final int farm;

  FlickrImageEntity({
    required this.id,
    required this.title,
    required this.secret,
    required this.server,
    required this.farm
  });

  factory FlickrImageEntity.fromModel(FlickrImage model) {
    return FlickrImageEntity(
      id: model.id,
      title: model.title,
      secret: model.secret,
      server: model.server,
      farm: model.farm
    );
  }
}

