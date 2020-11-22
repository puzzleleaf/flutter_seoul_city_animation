import 'dart:math';

import 'package:flutter/material.dart';

class Particle extends StatelessWidget {
  final double x;
  final double y;
  final double rotation;

  const Particle({Key key, this.x, this.y, this.rotation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Transform(
        transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(rotation * pi / 180.0),
        child: Image.asset(
          'assets/images/flower.png',
          width: 10,
        ),
      ),
      bottom: y,
      left: x,
    );
  }
}
