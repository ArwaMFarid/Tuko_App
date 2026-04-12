import 'package:flutter/material.dart';
import 'package:tuko_app/core/app_color.dart';
import 'package:tuko_app/screens/auth/login_screen.dart';
import 'package:tuko_app/screens/auth/register_screen.dart';
import 'package:tuko_app/screens/color_screen.dart';
import 'package:tuko_app/screens/family_screen.dart';
import 'package:tuko_app/screens/home_screen.dart';
import 'package:tuko_app/screens/number_screen.dart';
import 'package:tuko_app/screens/phrases_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
          LoginScreen.routeName: (context) => LoginScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          NumberScreen.routeName: (context) => NumberScreen(),
          ColorScreen.routeName: (context) => ColorScreen(),
          FamilyScreen.routeName: (context) => FamilyScreen(),
          PhrasesScreen.routeName: (context) => PhrasesScreen(),
        },
        home: LoginScreen()
    );
  }
}
