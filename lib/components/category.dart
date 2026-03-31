import 'package:flutter/material.dart';
import 'package:tuko_app/core/app_color.dart';

class Category extends StatefulWidget {
  final String? text;
  final Color? color;
  final VoidCallback? ontap;

  const Category({this.text,this.color, this.ontap});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () async {
        setState(() => _isPressed = true);
        await Future.delayed(const Duration(milliseconds: 200));
        setState(() => _isPressed = false);
        await Future.delayed(const Duration(milliseconds: 50));
        widget.ontap?.call();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.09,
            width: double.infinity,
            color: AppColor.darkblue,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  width: _isPressed ? MediaQuery
                      .of(context)
                      .size
                      .width * 1.5 : 0,
                  height: _isPressed ? MediaQuery
                      .of(context)
                      .size
                      .width * 1.5 : 0,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.text!,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}