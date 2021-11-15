import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/ui/clickable_icon.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:food_delivery/utils/res/dimens.dart';
import 'package:food_delivery/utils/widgets_warehouse.dart';

class MainTopBar extends StatefulWidget {
  final Color? overrideMainColor;

  final ClickableIcon? startClickableIcon;

  MainTopBar(
      {Key? key,
      this.overrideMainColor = Colors.transparent,
      this.startClickableIcon})
      : super(key: key);

  final STR_DELIVERY_TO = "Delivery to";
  final STR_FAKE_LOCATION = "Quan 9, VietNam";

  @override
  _MainTopBarState createState() => _MainTopBarState();
}

class _MainTopBarState extends State<MainTopBar> {
  @override
  Widget build(BuildContext context) {
    return _actionBar();
  }

  _actionBar() {
    return SizedBox(
        width: double.infinity,
        height: TOP_BAR_HEIGHT,
        child: Stack(alignment: AlignmentDirectional.center, children: <Widget>[
          Align(alignment: const Alignment(-0.9, 0.0), child: _startIcon()),
          Align(alignment: Alignment.center, child: _middle()),
          Align(alignment: const Alignment(0.9, 0.0), child: _end())
        ]));
  }

  _startIcon() {
    return widget.startClickableIcon != null
        ? widget.startClickableIcon!.getClickableIcon
        : ClickableIcon(
                onCLick: () => log("onClick didn't being defined"),
                iconWidget: IC_BURGER_MENU)
            .getClickableIcon;
  }

  _middle() {
    final fontTopSize = FONT_SIZE;
    final fontBotSize = FONT_SIZE_L;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.STR_DELIVERY_TO,
            style: TextStyle(
                color: TEXT_COLOR,
                fontSize: fontTopSize,
                decoration: TextDecoration.underline)),
        const SizedBox(height: PADDING_VERTICALLY_XXS),
        Text(widget.STR_FAKE_LOCATION,
            style: TextStyle(
                color: TEXT_COLOR_MAIN,
                fontSize: fontBotSize,
                fontWeight: FontWeight.bold))
      ],
    );
  }

  _end() {
    return IC_USER;
  }
}
