import 'package:flutter/material.dart';
import 'package:tuko_app/components/item.dart';
import 'package:tuko_app/core/app_assets.dart';
import 'package:tuko_app/core/app_color.dart';
import 'package:tuko_app/core/app_sound.dart';
import 'package:tuko_app/models/number.dart';

class NumberScreen extends StatefulWidget {
  static const String routeName = "NumberScreen";
  NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {

  final List<Number> numbers = [
    Number(
      image: AppAssets.one,
      japaneseName: "Ichi",
      englishName: "One",
        sound: AppSound.one
    ),
    Number(
      image: AppAssets.two,
      japaneseName: "Ni",
      englishName: "Two",
      sound: AppSound.two
    ),
    Number(
      image: AppAssets.three,
      japaneseName: "San",
      englishName: "Three",
      sound: AppSound.three
    ),
    Number(
      image: AppAssets.four,
      japaneseName: "Yon",
      englishName: "Four",
      sound: AppSound.four
    ),
    Number(
      image: AppAssets.five,
      japaneseName: "Go",
      englishName: "Five",
      sound: AppSound.five
    ),
    Number(
      image: AppAssets.six,
      japaneseName: "Roku",
      englishName: "Six",
      sound: AppSound.six
    ),
    Number(
      image: AppAssets.seven,
      japaneseName: "Shichi",
      englishName: "Seven",
      sound: AppSound.seven
    ),
    Number(
      image: AppAssets.eight,
      japaneseName: "Hachi",
      englishName: "Eight",
      sound: AppSound.eight
    ),
    Number(
      image: AppAssets.nine,
      japaneseName: "Kyū / Ku",
      englishName: "Nine",
      sound: AppSound.nine
    ),
    Number(
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
        itemCount: 10,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Item(number: numbers[index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
