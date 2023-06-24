import 'package:flutter/material.dart';

class ErrorNavigationScreen extends StatefulWidget {
  const ErrorNavigationScreen({Key? key}) : super(key: key);

  @override
  State<ErrorNavigationScreen> createState() => _ErrorNavigationScreenState();
}

class _ErrorNavigationScreenState extends State<ErrorNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ошибка'),
      ),
      body: Column(
        children: [
          Center(child: Text('Ошибка в навигации')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed("/home");
              },
              child: Text("Обновить")
          ),
        ],
      ),
    );
  }
}
