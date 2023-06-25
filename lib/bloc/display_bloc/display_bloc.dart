import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flicker/repository/FlickrRepository.dart';
import 'package:meta/meta.dart';

import '../../model/FlickrImage.dart';

part 'display_event.dart';
part 'display_state.dart';

class DisplayBloc extends Bloc<DisplayEvent, DisplayState> {
  final FlickRepository _flickrRepository = FlickRepository();

  DisplayBloc() : super(DisplayInitial()) {
    on<DisplayGetEvent>((event, emit) async {
      emit(DisplayLoadingState());
      if (event.title == "") {
        emit(DisplayErrorState("Не выбрано"));
        return;
      }
      try {
        List<FlickrImage> flickrImages = await _flickrRepository.searchPhotos(event.title, 1, 40);
        if (flickrImages.isEmpty) {
          emit(DisplayErrorState("Ничего не найдено"));
          return;
        }
        emit(DisplayLoadedState(flickrImages));
      }
      catch (e) {
        emit(DisplayErrorState("Ничего не найдено"));
      }
    });
  }
}
