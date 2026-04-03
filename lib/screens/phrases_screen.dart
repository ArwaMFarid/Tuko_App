import 'package:flutter/material.dart';
import 'package:tuko_app/components/custom_item_card.dart';
import 'package:tuko_app/core/app_color.dart';
import 'package:tuko_app/core/app_sound.dart';
import 'package:tuko_app/models/card_model.dart';

class PhrasesScreen extends StatelessWidget {
  static const String routeName = "PhrasesScreen";

  PhrasesScreen({super.key});
  List<CardModel> phrasesList = [
    CardModel(
      japaneseName: "Kimasu ka?",
      englishName: "Are you comming?",
      sound: AppSound.areYouComing,
    ),
    CardModel(
      japaneseName: "Kōdoku suru koto o wasurenaide kudasai.",
      englishName: "Don't forget to subscribe.",
      sound: AppSound.dontForget,
    ),
    CardModel(
      japaneseName: "Gokibun wa ikaga desu ka?",
      englishName: "How are you feeling?",
      sound: AppSound.howAreYouFeeling,
    ),
    CardModel(
      japaneseName: "Watashi wa anime ga daisuki desu.",
      englishName: "I love anime.",
      sound: AppSound.iLoveAnime,
    ),
    CardModel(
      japaneseName: "Watashi wa puroguramingu ga daisuki desu.",
      englishName: "I love programming.",
      sound: AppSound.iLoveProgramming,
    ),
    CardModel(
      japaneseName: "Puroguramingu wa kantan desu.",
      englishName: "Programming is easy.",
      sound: AppSound.programmingIsEasy,
    ),
    CardModel(
      japaneseName: "Namae wa nan desu ka?",
      englishName: "What is your name?",
      sound: AppSound.whatIsYourName,
    ),
    CardModel(
      japaneseName: "Doko ni iku no?",
      englishName: "Where are you going?",
      sound: AppSound.whereAreYouGoing,
    ),
    CardModel(
      japaneseName: "Hai, watashi wa kite imasu.",
      englishName: "Yes, I'm comming.",
      sound: AppSound.yesImComing,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Phrases", style: TextStyle(color: AppColor.black,fontSize: 28),),
      ),
      body: ListView.builder(
        itemCount: phrasesList.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  CustomItemCard(item: phrasesList[index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
