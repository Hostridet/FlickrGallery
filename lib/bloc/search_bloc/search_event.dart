part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SetSearchAppBar extends SearchEvent {
  final String title;

  SetSearchAppBar(this.title);
}

class SetViewAppBar extends SearchEvent {
  final String title;
  final int axisCount;

  SetViewAppBar(this.title, this.axisCount);
}

class SetAxisCount extends SearchEvent {
  final String title;
  final int axisCount;

  SetAxisCount(this.title, this.axisCount);
}

