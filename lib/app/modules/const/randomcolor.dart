import 'dart:math';

import 'package:flutter/material.dart';

class RandomColor {
  int r = Random().nextInt(255);
  int g = Random().nextInt(255);
  int b = Random().nextInt(255);

  colors() {
    Color color = Color.fromARGB(255, r, g, b);
  }
}
