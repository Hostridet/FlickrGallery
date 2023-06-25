import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flicker/model/FlickrImage.dart';
import 'package:flicker/repository/FavouriteRepository.dart';
import 'package:flicker/repository/FlickrRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../interface/component/SearchAppBar.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SetSearchAppBar>((event, emit) async {
      emit(SearchAppBarState(event.title));
    });

    on<SetViewAppBar>((event, emit) async {
      emit(ViewAppBarState(event.title, event.axisCount));
    });

    on<SetAxisCount>((event, emit) {
      emit(ViewAppBarState(event.title, (event.axisCount * 2) % 7));
    });
  }
}
