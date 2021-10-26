import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/utils/constant.dart';
import 'package:food_delivery/utils/res/dimens.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({Key? key, this.onPressed, this.icon}) : super(key: key);

  final VoidCallback? onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ]
      ),
      child: IconButton(
          iconSize: CIRCLE_BUTTON_SIZE,
          onPressed: onPressed,
          icon: icon ?? IC_NULL,

      ),
    );
  }
}
