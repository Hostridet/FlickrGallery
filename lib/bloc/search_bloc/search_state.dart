part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchAppBarState extends SearchState {
  final List<FlickrImage> flickrImages;

  SearchAppBarState(this.flickrImages);
}

class ViewAppBarState extends SearchState {
  final List<FlickrImage> flickrImages;
  final String title;
  final int axisCount;

  ViewAppBarState(this.title, this.flickrImages, this.axisCount);
}
