import 'package:flutter/cupertino.dart';

class BackLogo extends StatelessWidget {
  final Widget textWidget;
  BackLogo({Key? key, required this.textWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/flickr.png"),
        SizedBox(height: 30),
        Center(
          child: textWidget,
        ),
      ],
    );
  }
}
