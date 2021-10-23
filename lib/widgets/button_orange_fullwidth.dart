import 'package:flutter/material.dart';
import 'package:food_delivery/utils/res/colors.dart';

class ButtonOrangeFullWidth extends StatelessWidget {
  const ButtonOrangeFullWidth({required this.text, this.onCLick, Key? key}) : super(key: key);

  final Function? onCLick;

  final String text;

  final BUTTON_HEIGHT = 55.0;
  final TEXT_BUTTON_SIZE = 15.0;

  final BORDER_RADIUS = 20.0;
  final PADDING_VERTICALLY = 15.0;
  final PADDING_HORIZONTALLY = 20.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(PADDING_HORIZONTALLY, PADDING_VERTICALLY, PADDING_HORIZONTALLY, 0.0),
          child: SizedBox(
            width: double.infinity,
            height: BUTTON_HEIGHT,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(BORDER_RADIUS))
                  ),
                  backgroundColor: MaterialStateProperty.all(MAIN_COLOR_DARKER)
              ),
              onPressed: (() => onCLick ?? onButtonPressed()),
              child: Text(text, style: TextStyle(fontSize: TEXT_BUTTON_SIZE)),
            ),
          ),
        );
  }

  void onButtonPressed(){
    print('flutter sucks');
  }
}
