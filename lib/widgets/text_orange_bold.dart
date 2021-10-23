import 'package:flutter/material.dart';
import 'package:food_delivery/utils/res/colors.dart';

class TextOrangeBold extends StatelessWidget {
  const TextOrangeBold({required this.text, Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, color: MAIN_COLOR, fontSize: 20.0),
    );
  }
}
