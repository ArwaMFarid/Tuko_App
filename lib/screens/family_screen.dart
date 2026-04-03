import 'package:flutter/material.dart';
import 'package:tuko_app/components/custom_item_card.dart';
import 'package:tuko_app/core/app_assets.dart';
import 'package:tuko_app/core/app_color.dart';
import 'package:tuko_app/core/app_sound.dart';
import 'package:tuko_app/models/card_model.dart';

class FamilyScreen extends StatefulWidget {
  static const String routeName = "FamilyScreen";

  const FamilyScreen({super.key});

  @override
  State<FamilyScreen> createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {
  List<CardModel> familyList = [
    CardModel(
      image: AppAssets.father,
      japaneseName: "Chichioya",
      englishName: "Father",
      sound: AppSound.father,
    ),
    CardModel(
      image: AppAssets.mother,
      japaneseName: "Hahaoya",
      englishName: "Mother",
      sound: AppSound.mother,
    ),
    CardModel(
      image: AppAssets.son,
      japaneseName: "Musuko",
      englishName: "Son",
      sound: AppSound.son,
    ),
    CardModel(
      image: AppAssets.daughter,
      japaneseName: "Musume",
      englishName: "Daughter",
      sound: AppSound.daughter,
    ),
    CardModel(
      image: AppAssets.olderBrother,
      japaneseName: "Nīsan",
      englishName: "Older Brother",
      sound: AppSound.olderBrother,
    ),
    CardModel(
      image: AppAssets.youngerBrother,
      japaneseName: "Otouto",
      englishName: "Younger Brother",
      sound: AppSound.youngerBrother,
    ),
    CardModel(
      image: AppAssets.olderSister,
      japaneseName: "Ane",
      englishName: "Older Sister",
      sound: AppSound.olderSister,
    ),
    CardModel(
      image: AppAssets.youngerSister,
      japaneseName: "Imouto",
      englishName: "Younger Sister",
      sound: AppSound.youngerSister,
    ),
    CardModel(
      image: AppAssets.grandFather,
      japaneseName: "Ojisan",
      englishName: "Grandfather",
      sound: AppSound.grandFather,
    ),
    CardModel(
      image: AppAssets.grandMother,
      japaneseName: "Sobo",
      englishName: "Grandmother",
      sound: AppSound.grandMother,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Family members", style: TextStyle(color: AppColor.black,fontSize: 28),),
      ),
      body: ListView.builder(
        itemCount: familyList.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  CustomItemCard(item: familyList[index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
