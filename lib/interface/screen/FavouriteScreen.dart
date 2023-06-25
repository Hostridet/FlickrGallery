import 'package:flicker/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Избранное"),
      ),
      body: BlocProvider<FavouriteBloc>(
        create: (context) =>
        FavouriteBloc()
          ..add(FavouriteGetEvent()),
        child: BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            if (state is FavouriteErrorState) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is FavouriteLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FavouriteLoadedState) {
              return GridView.builder(
                itemCount: state.flickrImages.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: CachedNetworkImage(
                      imageUrl: "https://live.staticflickr.com/${state.flickrImages[index].server}/${state.flickrImages[index].id}_${state.flickrImages[index].secret}.jpg",
                      placeholder: (context, url) => Container(decoration: BoxDecoration(color: Colors.white54)),
                      errorWidget: (context, url, error) => Container(decoration: BoxDecoration(color: Colors.white54), child: Icon(Icons.error)),
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
