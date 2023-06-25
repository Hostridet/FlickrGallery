part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteLoadingState extends FavouriteState {}

class FavouriteLoadedState extends FavouriteState {
  final List<FlickrImage> flickrImages;

  FavouriteLoadedState(this.flickrImages);
}

class FavouriteErrorState extends FavouriteState {
  final String error;

  FavouriteErrorState(this.error);
}
