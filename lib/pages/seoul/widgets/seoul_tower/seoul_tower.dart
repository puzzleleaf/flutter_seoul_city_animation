import 'package:flutter/material.dart';

class SeoulTower extends StatelessWidget {
  final Size size;

  const SeoulTower({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          'assets/images/tower.png',
          width: size.width,
          height: 250,
          fit: BoxFit.fitHeight,
        ),
      ],
    );
  }
}
