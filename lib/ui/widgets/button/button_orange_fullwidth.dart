import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/ui/widgets/text/text_helper.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:food_delivery/utils/res/dimens.dart';

class ButtonOrangeFullWidth extends StatelessWidget {
  final Function? onCLick;

  const ButtonOrangeFullWidth({required this.text, this.onCLick, Key? key})
      : super(key: key);

  final String text;

  final BUTTON_HEIGHT = 65.0;
  final TEXT_BUTTON_SIZE = 15.0;

  final PADDING_VERTICALLY = 15.0;
  final PADDING_HORIZONTALLY = 20.0;

  final radius = 25.0;

  @override
  Widget build(BuildContext context) {
    final HPadding = PADDING_HORIZONTALLY;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: HPadding),
      child: GestureDetector(
        onTap: () => _onButtonPressed(),
        child: Container(
          width: double.infinity,
          height: BUTTON_HEIGHT,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              gradient: const LinearGradient(
                  colors: [
                    MAIN_COLOR,
                    MAIN_COLOR_DARKER,
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.5, 1.0],
                  tileMode: TileMode.clamp)),
          child: Center(
              child: titleM(text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: TEXT_COLOR_INVERSED,
                      fontSize: FONT_SIZE_XL))),
        ),
      ),
    );
  }

  void _onButtonPressed() {
    onCLick != null ? onCLick!() : log('orange button has just been clicked');
  }
}
