import 'package:flutter/material.dart';
import 'package:tuko_app/core/app_color.dart';
import 'package:tuko_app/screens/color_screen.dart';
import 'package:tuko_app/screens/family_screen.dart';
import 'package:tuko_app/screens/home_screen.dart';
import 'package:tuko_app/screens/number_screen.dart';
import 'package:tuko_app/screens/phrases_screen.dart';


void main() {
  runApp(TukoApp());
}

class TukoApp extends StatelessWidget {
  const TukoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.beig,
          appBarTheme: AppBarTheme(
            scrolledUnderElevation: 0,
            backgroundColor: AppColor.beig,
            foregroundColor: Colors.black,
            titleTextStyle: TextStyle(color: AppColor.black),
          ),
        ),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          NumberScreen.routeName: (context) => NumberScreen(),
          ColorScreen.routeName: (context) => ColorScreen(),
          FamilyScreen.routeName: (context) => FamilyScreen(),
          PhrasesScreen.routeName: (context) => PhrasesScreen(),
        },
        home: HomeScreen()
    );
  }
}
