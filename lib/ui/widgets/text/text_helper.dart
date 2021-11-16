import 'package:flutter/cupertino.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:food_delivery/utils/res/dimens.dart';

titleL(String str, {TextStyle? style}) => Text(str,
    style: style ??
        const TextStyle(
            fontWeight: FontWeight.bold,
            color: TEXT_COLOR,
            fontSize: FONT_SIZE_XXXL));

titleM(String str, {TextStyle? style}) => Text(str,
    style: style ??
        const TextStyle(
            fontWeight: FontWeight.bold,
            color: TEXT_COLOR,
            fontSize: FONT_SIZE_XL));