import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flicker/repository/FavouriteRepository.dart';
import 'package:meta/meta.dart';

import '../../model/FlickrImage.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavouriteRepository _favouriteRepository = FavouriteRepository();

  FavouriteBloc() : super(FavouriteInitial()) {
    on<FavouriteGetEvent>((event, emit) async {
      emit(FavouriteLoadingState());
      try {
        List<FlickrImage> flickrImages = await _favouriteRepository.getAllImage();
        emit(FavouriteLoadedState(flickrImages));
      }
      catch (e) {
        emit(FavouriteErrorState("Не удалось загрузить избранное"));
      }
    });
  }
}
