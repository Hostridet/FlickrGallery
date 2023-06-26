import 'package:flicker/data/entity/FlickrImageEntity.dart';
import 'package:floor/floor.dart';

@dao
abstract class FlickrImageDao {

  @Query('SELECT * FROM FlickrImageEntity')
  Future<List<FlickrImageEntity>> getAllImage();

  @Query('SELECT * FROM FlickrImageEntity WHERE id = :id')
  Stream<FlickrImageEntity?> findImageById(String id);

  @insert
  Future<void> insertImage(FlickrImageEntity flickrImage);

  @delete
  Future<void> deleteImage(FlickrImageEntity flickrImage);
}

