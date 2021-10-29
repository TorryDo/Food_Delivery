import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/utils/res/dimens.dart';
import 'package:food_delivery/utils/widgets_warehouse.dart';

class MainAppBar extends StatefulWidget {
  final Function? startClick;
  final Function? middleClick;
  final Function? endClick;

  final Widget? overrideStartWidget;
  final Widget? overrideMiddleWidget;
  final Widget? overrideEndWidget;

  final Color? overrideMainColor;

  const MainAppBar({
    Key? key,
    this.startClick,
    this.middleClick,
    this.endClick,
    this.overrideStartWidget,
    this.overrideMiddleWidget,
    this.overrideEndWidget,
    this.overrideMainColor = Colors.transparent,
  }) : super(key: key);

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return _appBar();
  }

  _appBar() {
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
    return IC_LEFT_ARROW;
  }
  _middle() {
    return IC_LEFT_ARROW;
  }
  _end() {
    return IC_LEFT_ARROW;
  }
}
