part of 'display_bloc.dart';

@immutable
abstract class DisplayState {}

class DisplayInitial extends DisplayState {}

class DisplayLoadingState extends DisplayState {}

class DisplayLoadedState extends DisplayState {
  final List<FlickrImage> flickrImages;

  DisplayLoadedState(this.flickrImages);
}

class DisplayErrorState extends DisplayState {
  final String error;

  DisplayErrorState(this.error);
}
