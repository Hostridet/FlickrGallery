part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchAppBarState extends SearchState {
  final String title;

  SearchAppBarState(this.title);
}

class ViewAppBarState extends SearchState {
  final String title;
  final int axisCount;

  ViewAppBarState(this.title, this.axisCount);
}
