import 'package:flutter/material.dart';

class Styles {
  static const TextStyle title = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: Color.fromRGBO(0, 176, 236, 1),
  );
  static const TextStyle subtitle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static const TextStyle body = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static const TextStyle caption = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );
  // ignore: prefer_const_constructors
  static final formHeader = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  static ThemeData primaryTheme = ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      fontFamily: 'Poppins');
}
