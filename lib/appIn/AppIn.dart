import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../interface/route/RouteGenerator.dart';
import '../interface/screen/HomeScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flickr gallery',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffB5C9FD),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff6202EE)
        )
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator().generateRoute,
      home: const HomeScreen(),
    );
  }
}