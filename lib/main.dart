import 'package:flutter/material.dart';
import 'package:tuko_app/screens/color_screen.dart';
import 'package:tuko_app/screens/family_screen.dart';
import 'package:tuko_app/screens/home_screen.dart';
import 'package:tuko_app/screens/number_screen.dart';
import 'package:tuko_app/screens/phases_screen.dart';


void main() {
  runApp(TukoApp());
}

class TukoApp extends StatelessWidget {
  const TukoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          NumberScreen.routeName: (context) => NumberScreen(),
          ColorScreen.routeName: (context) => ColorScreen(),
          FamilyScreen.routeName: (context) => FamilyScreen(),
          PhasesScreen.routeName: (context) => PhasesScreen(),
        },
        home: HomeScreen()
    );
  }
}
