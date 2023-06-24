import 'package:flicker/interface/component/BackLogo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Поиск изображений"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/search");
              },
              icon: Icon(Icons.search)
          )
        ],
      ),
      body: BackLogo(
        textWidget: Text(
          "Можно найти все",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
