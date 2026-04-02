import 'package:flutter/material.dart';
import 'package:tuko_app/components/category.dart';
import 'package:tuko_app/core/app_color.dart';
import 'package:tuko_app/screens/color_screen.dart';
import 'package:tuko_app/screens/family_screen.dart';
import 'package:tuko_app/screens/number_screen.dart';
import 'package:tuko_app/screens/phases_screen.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  final List<String> items = ["Numbers", "Colors", "Family Members", "Phases"];
  final List<Widget> screens = [NumberScreen(), ColorScreen(), FamilyScreen(), PhasesScreen()];

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: Text("Tuko"),
           titleTextStyle: TextStyle(fontSize: 30, color: AppColor.black),
         ),
        body: ListView.builder(
          itemCount: widget.items.length,
            itemBuilder: (context, index) {
            return Category(
              ontap:()
              {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>widget.screens[index]),);
              },
              text: widget.items[index],
            );

            },
        )
    );
  }
}
