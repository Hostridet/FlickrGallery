part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteEvent {}

class FavouriteGetEvent extends FavouriteEvent {}

class FavouriteUpdateEvent extends FavouriteEvent {
  final FlickrImage flickrImage;

  FavouriteUpdateEvent(this.flickrImage);
}

class FavouriteStatusEvent extends FavouriteEvent {
  final FlickrImage flickrImages;

  FavouriteStatusEvent(this.flickrImages);
}