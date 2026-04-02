import 'package:flutter/material.dart';
import 'package:tuko_app/components/custom_item_card.dart';
import 'package:tuko_app/core/app_assets.dart';
import 'package:tuko_app/core/app_color.dart';
import 'package:tuko_app/core/app_sound.dart';
import 'package:tuko_app/models/card_model.dart';

class ColorScreen extends StatefulWidget {
  static const String routeName = "ColorScreen";

  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  List<CardModel> colorList = [
    CardModel(
      image: AppAssets.black,
      japaneseName: "Kuro",
      englishName: "Black",
      sound: AppSound.black,
    ),
    CardModel(
      image: AppAssets.brown,
      japaneseName: "Chairo",
      englishName: "Brown",
      sound: AppSound.brown,
    ),
    CardModel(
      image: AppAssets.dustyYellow,
      japaneseName: "hokorippoi kiiro",
      englishName: "Dusty Yellow",
      sound: AppSound.dustyYellow,
    ),
    CardModel(
      image: AppAssets.gray,
      japaneseName: "Gurē",
      englishName: "Gray",
      sound: AppSound.gray,
    ),
    CardModel(
      image: AppAssets.green,
      japaneseName: "Midori",
      englishName: "Green",
      sound: AppSound.green,
    ),
    CardModel(
      image: AppAssets.red,
      japaneseName: "Aka",
      englishName: "Red",
      sound: AppSound.red,
    ),
    CardModel(
      image: AppAssets.white,
      japaneseName: "Shiro",
      englishName: "White",
      sound: AppSound.white,
    ),
    CardModel(
      image: AppAssets.yellow,
      japaneseName: "Kiiro",
      englishName: "Yellow",
      sound: AppSound.yellow,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Colors", style: TextStyle(color: AppColor.black,fontSize: 28),),
      ),
      body: ListView.builder(
        itemCount: colorList.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  CustomItemCard(item: colorList[index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
