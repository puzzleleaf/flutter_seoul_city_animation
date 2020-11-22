import 'package:city_animation/models/city.dart';
import 'package:city_animation/pages/seoul/seoul_detail_page.dart';
import 'package:city_animation/pages/seoul/seoul_scenery.dart';
import 'package:flutter/material.dart';

final cityData = [
  City(
    title: "Gyeongbokgung",
    name: "Gyeongbokgung",
    cardStartColor: Colors.grey,
    cardEndColor: Colors.white,
    detailStartColor: Color(0xffB2E9FD),
    detailEndColor: Color(0xffDED3BF),
    description: 'Built in 1395, Gyeongbokgung Palace is also commonly referred to as the Northern Palace because its location is furthest north when compared to the neighboring palaces of Changdeokgung (Eastern Palace) and Gyeonghuigung (Western Palace) Palace. Gyeongbokgung Palace is arguably the most beautiful, and remains the largest of all five palaces\n\n'
        'The premises were once destroyed by fire during the Imjin War (1592-1598). However, all of the palace buildings were later restored under the leadership of Heungseondaewongun during the reign of King Gojong (1852-1919).\n\n'
        'Remarkably, the most representative edifices of the Joseon dynasty, Gyeonghoeru Pavilion and the pond around Hyangwonjeong Pavillion have remained relatively intact. The raised dias and stone markers of Geunjeongjeon showcase the representative art style of their time.\n\n'
        'The National Palace Museum of Korea is located south of Heungnyemun Gate, and the National Folk Museum is located on the eastern side of Hyangwonjeong Pavillion.\n\n',
  ),
  City(
      title: "Seoul Tower",
      name: "Seoul Tower",
      cardStartColor: Colors.grey,
      cardEndColor: Colors.white,
      detailStartColor: Color(0xffB2E9FD),
      detailEndColor: Color(0xff8EDFE0),
      description: 'Namsan Seoul Tower was the first tower-type tourism spot in Korea. The top of the tower is at almost 480 meters above sea level, including Namsan Mountain (243m) and the tower’s own height (236.7m), making it one of the tallest towers in Asia. It is comprised of Seoul Tower Plaza, recently opened to public access after 40 years, and N Seoul Tower, operated by CJ Foodville since 2005. The tower was first established as a broadcasting tower to send out TV and radio signals in 1969. As of now, it has become one of the representative landmarks and multi-cultural venues in Seoul.'
  ),
];

class SeoulPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: PageView.builder(
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 1500),
                      reverseTransitionDuration: Duration(milliseconds: 1000),
                      pageBuilder: (context, animation, scondaryAnimation) {
                        return SeoulDetailPage(
                          cityData: cityData[index],
                        );
                      },
                    ),
                  );
                },
                child: Hero(
                  tag: 'city',
                  child: SeoulScenery(
                    animationValue: 0.0,
                    cityData: cityData[index],
                  ),
                ),
              ),
            );
          },
          itemCount: cityData.length,
        ),
      ),
    );
  }
}
