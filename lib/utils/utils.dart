import 'dart:math';

class Utils {
  static double randomRange(double min, double max) {
    var rnd = Random();
    return (rnd.nextDouble() * (max - min) + min);
  }
}