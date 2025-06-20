import 'package:flutter/material.dart';

class MyColors {
  static const Color mybackground = Color.fromARGB(255, 33, 21, 51);
  static const Color myText = Color(0xFF6B1A6B);
  static final LinearGradient myGreadient1 = LinearGradient(colors: [
    Color(0xFF4A15F4),
    Color(0xFF6B1A6B),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  static const LinearGradient myGreadient2 = LinearGradient(colors: [
    // Color(0xFF4A15F4),
    // Color(0xFF6B1A6B),
    Color(0xff9333EA), Color(0xFF3B82F6)
  ],begin: Alignment.topLeft, end: Alignment.bottomRight
  );
}
