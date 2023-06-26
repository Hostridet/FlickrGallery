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

    on<FavouriteUpdateEvent>((event, emit) async {
      var isFavourite = await _favouriteRepository.isFavouriteImage(event.flickrImage);
      isFavourite ? await deleteFavourite(event, emit) : await addFavourite(event, emit);
      emit(FavouriteStatusState(!isFavourite));
    });

    on<FavouriteStatusEvent>((event, emit) async {
      emit(FavouriteStatusState(await _favouriteRepository.isFavouriteImage(event.flickrImages)));
    });
  }

  Future<void> addFavourite(FavouriteUpdateEvent event, Emitter<FavouriteState> emit) async {
    insertImage(event.flickrImage);
    emit(FavouriteMessageState("Добавлено в избранное"));
  }

  Future<void> deleteFavourite(FavouriteUpdateEvent event, Emitter<FavouriteState> emit) async {
    deleteImage(event.flickrImage);
    emit(FavouriteMessageState("Удалено из избранного"));
  }

  Future<void> insertImage(FlickrImage flickrImage) => _favouriteRepository.insertImage(flickrImage);

  Future<void> deleteImage(FlickrImage flickrImage) => _favouriteRepository.deleteImage(flickrImage);
}
