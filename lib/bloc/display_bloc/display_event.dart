part of 'display_bloc.dart';

@immutable
abstract class DisplayEvent {}

class DisplayGetEvent extends DisplayEvent {
  final String title;

  DisplayGetEvent(this.title);
}
