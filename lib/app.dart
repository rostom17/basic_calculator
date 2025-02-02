import 'package:basic_calculator/view/home_page.dart';
import 'package:flutter/material.dart';

class BasicCalulator extends StatelessWidget {
  const BasicCalulator({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _lightTheme(screenHeight, screenWidth),
      darkTheme: _darkTheme(screenHeight, screenWidth),
      home: HomePage(),
    );
  }

  ThemeData _darkTheme(double screenHeight, double screenWidth) {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.grey.shade900,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          side: BorderSide.none,
          fixedSize: Size(screenWidth * .215, screenHeight / 10.2),
          //textStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w700)
        ),
      ),
    );
  }

  ThemeData _lightTheme(double screenHeight, double screenWidth) {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.grey.shade100,
          foregroundColor: Colors.black,
          side: BorderSide.none,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          //side: BorderSide.none,
          fixedSize: Size(screenWidth * .215, screenHeight / 10.2),
          //textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)
        ),
      ),
    );
  }
}
