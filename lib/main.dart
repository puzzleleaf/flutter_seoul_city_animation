import 'package:city_animation/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.black,
          )
        ),
      ),
      routes: routes,
    );
  }
}
