import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:food_delivery/utils/res/dimens.dart';
import 'package:food_delivery/utils/widgets_warehouse.dart';

class AppbarWelcome extends StatelessWidget {
  final Function? leftButtonCLick;

  const AppbarWelcome({Key? key, this.leftButtonCLick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: TOP_BAR_HEIGHT,
        child: Stack(alignment: AlignmentDirectional.center, children: <Widget>[
          Align(alignment: const Alignment(-0.9, 0.0), child: _startIcon()),
          Align(alignment: Alignment.center, child: LOGO(size: ICON_SIZE_XL)),
        ]));
  }

  _startIcon() {
    return GestureDetector(
        onTap: () {
          log('tapped');
          if (leftButtonCLick != null) {
            leftButtonCLick!();
            log('back to prev screen');
          }
        },
        child: IC_LEFT_ARROW);
  }
}
