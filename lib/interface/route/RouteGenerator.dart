
import 'package:flicker/interface/screen/ErrorNavigationScreen.dart';
import 'package:flicker/interface/screen/FavouriteScreen.dart';
import 'package:flicker/interface/screen/HomeScreen.dart';
import 'package:flicker/interface/screen/SearchScreen.dart';
import 'package:flutter/material.dart';

class RouteGenerator
{



  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/home':
        return CustomPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case '/search':
        return CustomPageRoute(
          builder: (context) => const SearchScreen(),
        );
      case '/favourite':
        return CustomPageRoute(
          builder: (context) => const FavouriteScreen(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CustomPageRoute(builder: (_) {
      return ErrorNavigationScreen();
    });
  }
}

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}