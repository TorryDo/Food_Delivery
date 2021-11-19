import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:food_delivery/utils/res/dimens.dart';
import 'package:food_delivery/utils/route_keys.dart';
import 'package:food_delivery/utils/widgets_warehouse.dart';
import 'package:get/get.dart';

class AppbarWelcome extends StatelessWidget {
  final Function? leftButtonCLick;
  final Function? rightButtonClick;

  const AppbarWelcome({Key? key, this.leftButtonCLick, this.rightButtonClick})
      : super(key: key);

  final _SKIP = 'Skip';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: TOP_BAR_HEIGHT,
        child: Stack(alignment: AlignmentDirectional.center, children: <Widget>[
          Align(alignment: const Alignment(-0.9, 0.0), child: _startIcon()),
          Align(alignment: Alignment.center, child: _middle()),
          Align(alignment: const Alignment(0.85, 0.0), child: _end())
        ]));
  }

  _startIcon() {
    return GestureDetector(
        onTap: () => _defaultLeftButtonClick(), child: IC_LEFT_ARROW);
  }

  void _defaultLeftButtonClick() {
    log('tapped');
    if (leftButtonCLick != null) {
      leftButtonCLick!();
      log('back to prev screen');
    }
  }

  _middle() {
    return LOGO(size: ICON_SIZE_XL);
  }

  _end() {
    return GestureDetector(
      onTap: () => _defaultRightButtonCLick(),
      child: Text(_SKIP,
          style: const TextStyle(
              color: TEXT_COLOR_MAIN,
              fontWeight: FontWeight.bold,
              fontSize: FONT_SIZE_XL)),
    );
  }

  void _defaultRightButtonCLick() {
    if (rightButtonClick != null) {
      rightButtonClick!();
      return;
    }
    Get.offAndToNamed(HOME_SCREEN_KEY);
  }
}
