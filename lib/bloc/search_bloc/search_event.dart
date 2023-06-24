part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SetSearchAppBar extends SearchEvent {
  final String title;

  SetSearchAppBar(this.title);
}

class SetViewAppBar extends SearchEvent {
  final String title;
  final List<FlickrImage> flickrImages;
  final int axisCount;

  SetViewAppBar(this.title, this.flickrImages, this.axisCount);
}

class SetAxisCount extends SearchEvent {
  final List<FlickrImage> flickrImages;
  final String title;
  final int axisCount;

  SetAxisCount(this.title, this.flickrImages, this.axisCount);
}

class UpdateImageEvent extends SearchEvent {
  final String title;
  final int axisCount;

  UpdateImageEvent(this.title, this.axisCount);
}

