import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tuko_app/core/app_color.dart';
import 'package:tuko_app/models/card_model.dart';

class CustomItemCard extends StatefulWidget {
  final CardModel item;
  const CustomItemCard({required this.item, super.key});

  @override
  State<CustomItemCard> createState() => _CustomItemCardState();
}

class _CustomItemCardState extends State<CustomItemCard> {
  bool soundIsPlayer = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.white,
        border: Border.all(width: 2, color: AppColor.red),
      ),
      height: MediaQuery.of(context).size.height * 0.12,
      width: double.infinity,
      child: Row(
        children: [
          if (widget.item.image != null)
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: widget.item.image != null
                    ? DecorationImage(image: AssetImage(widget.item.image!))
                    :null,
                color: AppColor.red,
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.japaneseName,
                  style: TextStyle(color: AppColor.black, fontSize: 22),
                ),
                Text(
                  widget.item.englishName,
                  style: TextStyle(color: AppColor.black, fontSize: 18),
                ),
              ],
            ),
          ),
          IconButton(
            splashColor: AppColor.red,
            onPressed: () async {
              final player = AudioPlayer();
              int repeatCount = 2;
              setState(() {
                soundIsPlayer = true;
              });
              for (int i = 0; i < repeatCount; i++) {
                await player.play(AssetSource(widget.item.sound));
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
                ? Icon(Icons.pause, color: AppColor.red, size: 50)
                : Icon(Icons.play_arrow, color: AppColor.red, size: 50),
          ),
        ],
      ),
    );
  }
}
