import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/utils/res/dimens.dart';

Widget IC_NULL = SvgPicture.asset('assets/icons/ic_question_mark.svg',
    semanticsLabel: 'imagenull');

Widget IC_LEFT_ARROW = SvgPicture.asset(
  'assets/icons/ic_left_arrow.svg',
  semanticsLabel: 'left arrow',
  width: ICON_SIZE_L,
  height: ICON_SIZE_L,
);

Widget LOGO({double? size}) {
  const LOGO_SIZE = 100.0;

  return SvgPicture.asset(
    'assets/icons/ic_applogo.svg',
    semanticsLabel: 'app logo',
    width: size ?? LOGO_SIZE,
    height: size ?? LOGO_SIZE,
  );
}

Widget IC_SEARCH({double? size = ICON_SIZE_XL}) {
  return SvgPicture.asset(
    'assets/icons/ic_search.svg',
    semanticsLabel: 'search icon',
    width: size,
    height: size,
  );
}
