import 'package:flutter/widgets.dart';

class ClickableIcon{
  Function? onCLick;
  Widget iconWidget;

  ClickableIcon({this.onCLick, required this.iconWidget});
}