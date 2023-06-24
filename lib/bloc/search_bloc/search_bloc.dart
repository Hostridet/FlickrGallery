import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flicker/model/FlickrImage.dart';
import 'package:flicker/repository/FlickrRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  FlickRepository _flickrRepository = FlickRepository();
  SearchBloc() : super(SearchInitial()) {
    on<SetSearchAppBar>((event, emit) async {
      if (event.title.isEmpty) {
        emit(SearchAppBarState([]));
        return;
      }
      List<FlickrImage> flickrImages = await _flickrRepository.searchPhotos(event.title, 1, 40);
      emit(SearchAppBarState(flickrImages));
    });

    on<SetViewAppBar>((event, emit) {
      emit(ViewAppBarState(event.title, event.flickrImages, event.axisCount));
    });

    on<UpdateImageEvent>((event, emit) async {
      if (event.title.isEmpty) {
        emit(ViewAppBarState(event.title, [], event.axisCount));
        return;
      }
      List<FlickrImage> flickrImages = await _flickrRepository.searchPhotos(event.title, 1, 40);
      emit(ViewAppBarState(event.title, flickrImages, event.axisCount));
    });



    on<SetAxisCount>((event, emit) {
      if (event.axisCount == 1) {
        emit(ViewAppBarState(event.title, event.flickrImages, 2));
        return;
      }
      if (event.axisCount == 2) {
        emit(ViewAppBarState(event.title, event.flickrImages, 4));
        return;
      }
      add(SetViewAppBar(event.title, event.flickrImages, 1));
    });
  }
}
