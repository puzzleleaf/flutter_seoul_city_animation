import 'package:city_animation/models/city.dart';
import 'package:city_animation/pages/seoul/seoul_scenery.dart';
import 'package:flutter/material.dart';

class SeoulDetailPage extends StatelessWidget {
  final City cityData;

  const SeoulDetailPage({Key key, this.cityData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Hero(
                tag: 'city',
                flightShuttleBuilder: _buildFlightWidget,
                placeholderBuilder: (context, size, widget) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                  );
                },
                child: SeoulScenery(
                  animationValue: 1.0,
                  cityData: cityData,
                ),
              ),
              _buildDescriptionWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cityData.title,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            cityData.description,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlightWidget(
      BuildContext flightContext,
      Animation<double> heroAnimation,
      HeroFlightDirection flightDirection,
      BuildContext fromHeroContext,
      BuildContext toHeroContext) {
    return AnimatedBuilder(
      animation: heroAnimation,
      builder: (context, child) {
        return SeoulScenery(
          animationValue: heroAnimation.value,
          cityData: cityData,
        );
      },
    );
  }
}
