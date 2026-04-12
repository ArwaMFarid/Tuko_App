import 'package:flutter/material.dart';
import 'package:tuko_app/core/app_color.dart';

class CustomButton extends StatelessWidget {
  static const String routeName = "CustomButton";
  final String textbutton;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.textbutton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.red,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        textbutton,
        style: TextStyle(
          color: AppColor.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
