import 'package:flutter/material.dart';

class NumberScreen extends StatelessWidget {
  static const String routeName = "NumberScreen";
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Numbers"),

      ),
    );
  }
}
