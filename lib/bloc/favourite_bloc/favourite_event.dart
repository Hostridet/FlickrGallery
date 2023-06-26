part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteEvent {}

class FavouriteGetEvent extends FavouriteEvent {}

class FavouriteUpgradeEvent extends FavouriteEvent {
  final FlickrImage flickrImage;

  FavouriteUpgradeEvent(this.flickrImage);
}
