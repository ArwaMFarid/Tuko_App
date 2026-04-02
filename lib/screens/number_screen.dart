import 'package:flutter/material.dart';
import 'package:tuko_app/components/custom_item_card.dart';
import 'package:tuko_app/core/app_assets.dart';
import 'package:tuko_app/core/app_color.dart';
import 'package:tuko_app/core/app_sound.dart';
import 'package:tuko_app/models/card_model.dart';

class NumberScreen extends StatefulWidget {
  static const String routeName = "NumberScreen";
  NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {

  final List<CardModel> numbers = [
    CardModel(
      image: AppAssets.one,
      japaneseName: "Ichi",
      englishName: "One",
        sound: AppSound.one
    ),
    CardModel(
      image: AppAssets.two,
      japaneseName: "Ni",
      englishName: "Two",
      sound: AppSound.two
    ),
    CardModel(
      image: AppAssets.three,
      japaneseName: "San",
      englishName: "Three",
      sound: AppSound.three
    ),
    CardModel(
      image: AppAssets.four,
      japaneseName: "Yon",
      englishName: "Four",
      sound: AppSound.four
    ),
    CardModel(
      image: AppAssets.five,
      japaneseName: "Go",
      englishName: "Five",
      sound: AppSound.five
    ),
    CardModel(
      image: AppAssets.six,
      japaneseName: "Roku",
      englishName: "Six",
      sound: AppSound.six
    ),
    CardModel(
      image: AppAssets.seven,
      japaneseName: "Shichi",
      englishName: "Seven",
      sound: AppSound.seven
    ),
    CardModel(
      image: AppAssets.eight,
      japaneseName: "Hachi",
      englishName: "Eight",
      sound: AppSound.eight
    ),
    CardModel(
      image: AppAssets.nine,
      japaneseName: "Kyū / Ku",
      englishName: "Nine",
      sound: AppSound.nine
    ),
    CardModel(
      image: AppAssets.ten,
      japaneseName: "Jū",
      englishName: "Ten",
        sound: AppSound.ten
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Numbers", style: TextStyle(color: AppColor.black,fontSize: 28),),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  CustomItemCard(item: numbers[index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
