import 'package:flicker/data/entity/FlickrImageEntity.dart';
import 'package:flicker/model/FlickrImage.dart';
import 'package:flicker/data/app_database.dart';

class FavouriteRepository {
  Future<List<FlickrImage>> getAllImage() async {
    List<FlickrImage> flickImage = [];
    final database = await $FloorAppDataBase.databaseBuilder('edmt_cart_system.db').build();
    final allImage = await database.flickrImageDao.getAllImage();
    flickImage.addAll(allImage.map(FlickrImage.fromEntity));
    return flickImage;
  }

  Future<void> insertImage(FlickrImage flickrImage) async {
    final database = await $FloorAppDataBase.databaseBuilder('edmt_cart_system.db').build();
    database.flickrImageDao.insertImage(FlickrImageEntity.fromModel(flickrImage));
  }

  Future<void> deleteImage(FlickrImage flickrImage) async {
    final database = await $FloorAppDataBase.databaseBuilder('edmt_cart_system.db').build();
    database.flickrImageDao.deleteImage(FlickrImageEntity.fromModel(flickrImage));
  }
}
