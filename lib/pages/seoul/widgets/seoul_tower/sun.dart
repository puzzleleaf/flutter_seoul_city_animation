import 'package:flutter/material.dart';

class Sun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Image.asset(
        'assets/images/sun.png',
        width: 200,
      ),
    );
  }
}
