import 'package:flutter/material.dart';

class Trees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          bottom: screenSize.height * 0.07,
          right: screenSize.width * 0.15,
          child: _getRightTreeAsset(screenSize, false),
        ),
        Positioned(
          bottom: screenSize.height * 0.07,
          left: screenSize.width * 0.15,
          child: _getLeftTreeAsset(screenSize, false),
        ),
        Positioned(
          bottom: screenSize.height * 0.01,
          right: screenSize.width * 0.05,
          child: _getRightTreeAsset(screenSize, true),
        ),
        Positioned(
          bottom: screenSize.height * 0.01,
          left: screenSize.width * 0.05,
          child: _getLeftTreeAsset(screenSize, true),
        ),
      ],
    );
  }

  Widget _getLeftTreeAsset(Size screenSize, bool isFront) {
    final sizeRatio = isFront ? 0.2 : 0.15;
    return Image.asset('assets/images/left_tree.png', width: screenSize.width * sizeRatio,);
  }


  Widget _getRightTreeAsset(Size screenSize, bool isFront) {
    final sizeRatio = isFront ? 0.2 : 0.15;
    return Image.asset('assets/images/right_tree.png', width: screenSize.width * sizeRatio,);
  }
}
