import 'package:flicker/data/entity/FlickrImageEntity.dart';
import 'package:floor/floor.dart';

@dao
abstract class FlickrImageDao {

  @Query('SELECT * FROM FlickrImageEntity')
  Future<List<FlickrImageEntity>> getAllImage();

  @insert
  Future<void> insertImage(FlickrImageEntity flickrImage);

  @delete
  Future<void> deleteImage(FlickrImageEntity flickrImage);
}

