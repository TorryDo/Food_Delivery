import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:food_delivery/utils/res/dimens.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({Key? key, required this.label, required this.hint, this.isObscured})
      : super(key: key);

  final bool? isObscured;

  final String label;
  final _LABEL_SIZE = 17.0;
  final _LABEL_COLOR = TEXT_COLOR;

  final String hint;
  final _HINT_SIZE = 15.0;
  final _HINT_COLOR = TEXT_COLOR_SUPPORT;

  final _SPACE = 10.0;
  final _BORDER_RADIUS = 15.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: PADDING_HORIZONTALLY_L),
            child: Text(label, style: TextStyle(fontSize: _LABEL_SIZE, color: _LABEL_COLOR),),
          ),
          SizedBox(height: _SPACE),
          TextField(
            cursorColor: MAIN_COLOR_DARKER,
            maxLines: 1,
            obscureText: isObscured ?? false,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(fontSize: _HINT_SIZE, color: _HINT_COLOR),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(_BORDER_RADIUS),
                  borderSide: const BorderSide(color: MAIN_COLOR_DARKER,width: 2.0)
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(_BORDER_RADIUS),
                )

            ),
          )
        ],
      ),
    );
  }


}
