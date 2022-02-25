import 'package:flutter/material.dart';

class AppTheme
{
  static const TextStyle display1 = TextStyle(
    fontFamily: 'MountainsofChristmas',
    color: Colors.black,
    fontSize: 38,
    fontWeight: FontWeight.w600,
    letterSpacing: 2,
  );
  static const TextStyle display2 = TextStyle(
    fontFamily: 'MountainsofChristmas',
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1,
  );
  static final TextStyle hading = TextStyle(
    fontFamily: 'MountainsofChristmas',
    color: Colors.white.withOpacity(0.8),
    fontSize: 34,
    fontWeight: FontWeight.w900,
    letterSpacing: 2,
  );
  static final TextStyle subHeading = TextStyle(
    inherit: true,
    fontFamily: 'MountainsofChristmas',
    color: Colors.white.withOpacity(0.8),
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
}