import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBar extends StatefulWidget {
  final Function? startClick;
  final Function? middleClick;
  final Function? endClick;

  final Widget? overrideStartWidget;
  final Widget? overrideMiddleWidget;
  final Widget? overrideEndWidget;

  final Color? overrideMainColor;

  const AppBar({
    Key? key,
    this.startClick = () => log('start clicked'),
    this.middleClick,
    this.endClick,
    this.overrideStartWidget,
    this.overrideMiddleWidget,
    this.overrideEndWidget,
    this.overrideMainColor = Colors.transparent,
  }) : super(key: key);

  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
