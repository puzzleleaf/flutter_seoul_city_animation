import 'package:city_animation/models/city.dart';
import 'package:city_animation/pages/seoul/widgets/gyeongbokgung/gyeongbokgung.dart';
import 'package:city_animation/pages/seoul/widgets/gyeongbokgung/trees.dart';
import 'package:city_animation/pages/seoul/widgets/particles.dart';
import 'package:city_animation/pages/seoul/widgets/seoul_tower/seoul_tower.dart';
import 'package:city_animation/pages/seoul/widgets/seoul_tower/sun.dart';
import 'package:flutter/material.dart';

class SeoulScenery extends StatelessWidget {
  final City cityData;
  final double animationValue;

  const SeoulScenery({Key key, this.animationValue, this.cityData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final animation = AlwaysStoppedAnimation(animationValue);

    return Container(
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildBackgroundTransition(animation),
          _buildCity(animation, screenSize),
          _buildInfoTransition(animation),
        ],
      ),
    );
  }

  Widget _buildCity(animation, screenSize) {
    switch (cityData.name) {
      case 'Gyeongbokgung':
        return _buildGyeongbokgung(animation, screenSize);
      default:
        return _buildSeoulTower(animation, screenSize);
    }
  }

  Widget _buildInfoTransition(Animation animation) {
    final opacityTransition = Tween(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(curve: Interval(0.2, 0.5), parent: animation));

    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      alignment: Alignment.bottomCenter,
      child: Text(
        cityData.name,
        style: TextStyle(
          color: Colors.black.withOpacity(opacityTransition.value),
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  Widget _buildBackgroundTransition(Animation animation) {
    final gradientStart = ColorTween(
            begin: cityData.cardStartColor, end: cityData.detailStartColor)
        .evaluate(animation);

    final gradientEnd =
        ColorTween(begin: cityData.cardEndColor, end: cityData.detailEndColor)
            .evaluate(animation);

    final borderTransition =
        Tween<double>(begin: 20, end: 0).evaluate(animation);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8),
        ],
        borderRadius: BorderRadius.circular(borderTransition),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [gradientStart, gradientEnd],
        ),
      ),
    );
  }

  Widget _buildGyeongbokgung(animation, screenSize) {
    final startSize = Size(screenSize.width * 0.55, 0);
    final endSize = Size(screenSize.width * 0.80, 0);

    final sizeTransition = Tween(begin: startSize, end: endSize).animate(
        CurvedAnimation(
            curve: Interval(0.25, 1, curve: Curves.easeIn), parent: animation));

    final treesOpacityTransition = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            curve: Interval(0.75, 1, curve: Curves.easeIn), parent: animation));

    return Transform.translate(
      offset: Offset.zero,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Gyeongbokgung(
            size: sizeTransition.value,
          ),
          FadeTransition(
            opacity: treesOpacityTransition,
            child: Trees(),
          ),
          treesOpacityTransition.value == 1
            ? Particles(
            width: screenSize.width,
            height: 300,
            count: 10,
          ) : Container(),
        ],
      ),
    );
  }

  Widget _buildSeoulTower(animation, screenSize) {
    final startSize = Size(screenSize.width * 0.55, 0);
    final endSize = Size(screenSize.width * 0.80, 0);

    final sizeTransition = Tween(begin: startSize, end: endSize).animate(
        CurvedAnimation(
            curve: Interval(0.25, 1, curve: Curves.easeIn), parent: animation));

    final sunOpacityTransition = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            curve: Interval(0.75, 1, curve: Curves.easeIn), parent: animation));

    return Transform.translate(
      offset: Offset.zero,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SeoulTower(
            size: sizeTransition.value,
          ),
          FadeTransition(
            opacity: sunOpacityTransition,
            child: Sun(),
          ),
          sunOpacityTransition.value == 1
              ? Particles(
            width: screenSize.width,
            height: 300,
            count: 10,
          ) : Container(),
        ],
      ),
    );
  }
}
