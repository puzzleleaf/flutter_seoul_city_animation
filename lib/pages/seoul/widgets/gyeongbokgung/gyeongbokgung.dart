import 'package:flutter/material.dart';

class Gyeongbokgung extends StatelessWidget {
  final Size size;

  const Gyeongbokgung({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/building.png',
          width: size.width,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }
}
