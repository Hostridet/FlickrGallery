import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/FlickrImageDao.dart';
import 'package:flicker/data/entity/FlickrImageEntity.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [FlickrImageEntity])
abstract class AppDataBase extends FloorDatabase {
  FlickrImageDao get flickrImageDao;
}