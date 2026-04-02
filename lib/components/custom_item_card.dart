import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tuko_app/core/app_color.dart';
import 'package:tuko_app/models/card_model.dart';

class Item extends StatefulWidget {
  final CardModel number;
  const Item({required this.number, super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool soundIsPlayer = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.beig,
        border: Border.all(width: 2, color: AppColor.olive),
      ),
      height: MediaQuery.of(context).size.height * 0.12,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(widget.number.image)),
                color: AppColor.olive,
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.06),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.number.japaneseName,
                  style: TextStyle(color: AppColor.black, fontSize: 23),
                ),
                Text(
                  widget.number.englishName,
                  style: TextStyle(color: AppColor.black, fontSize: 18),
                ),
              ],
            ),
          ),
          IconButton(
            splashColor: AppColor.olive,
            onPressed: () async {
              final player = AudioPlayer();
              int repeatCount = 2;
              setState(() {
                soundIsPlayer = true;
              });
              for (int i = 0; i < repeatCount; i++) {
                await player.play(AssetSource(widget.number.sound));
                await player.onPlayerComplete.first;
                if (i < repeatCount - 1) {
                  await Future.delayed(const Duration(milliseconds: 300));
                }
              }
              await player.dispose();
              setState(() {
                soundIsPlayer = false;
              });
            },
            icon: soundIsPlayer
                ? Icon(Icons.pause, color: AppColor.olive, size: 50)
                : Icon(Icons.play_arrow, color: AppColor.olive, size: 50),
          ),
        ],
      ),
    );
  }
}
