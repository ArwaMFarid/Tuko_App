import 'package:flutter/material.dart';
import 'package:tuko_app/components/category.dart';
import 'package:tuko_app/screens/color_screen.dart';
import 'package:tuko_app/screens/family_screen.dart';
import 'package:tuko_app/screens/number_screen.dart';
import 'package:tuko_app/screens/phrases_screen.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  final List<String> items = ["Numbers", "Colors", "Family members", "Phrases"];
  final List<Widget> screens = [NumberScreen(), ColorScreen(), FamilyScreen(), PhrasesScreen()];

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
