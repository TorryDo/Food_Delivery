import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:food_delivery/utils/res/dimens.dart';

class MainBottomNavigation extends StatefulWidget {
  const MainBottomNavigation({Key? key}) : super(key: key);

  final _bottomWidth = double.infinity;
  final _bottomHeight = BOTTOM_BAR_HEIGHT;

  final _backgroundColor = THEME_COLOR;

  @override
  _MainBottomNavigationState createState() => _MainBottomNavigationState();
}

class _MainBottomNavigationState extends State<MainBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return _bottomBar();
  }

  _bottomBar() {
    return Container(
        height: widget._bottomHeight,
        width: widget._bottomWidth,
        color: Colors.redAccent,
        child: _stackedItem());
  }

  _stackedItem() {
    return Stack(children: [
      CustomPaint(
        size: Size(widget._bottomWidth, widget._bottomHeight),
        painter: RoundedBottomNavigationPainter(),
      )
    ]);
  }
}

class RoundedBottomNavigationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    var row1 = size.height * 0.2;
    var row2 = size.height * 0.3;
    var row3 = size.height * 0.5;

    var col1 = size.width * 0.15;
    var col2 = size.width * 0.3;
    var col3 = size.width * 0.4;
    var col4 = size.width * 0.45;

    var pointGX = size.width * 0.5;
    var pointGY = size.height * 0.1;

    var pointAX = 0.0;
    var pointAY = row3;

    var pointQ1X = 0.0;
    var pointQ1Y = row2;

    var pointBX = col1;
    var pointBY = row2;

    var pointCX = col2;
    var pointCY = row2;

    var pointQ2X = col3 * 0.9;
    var pointQ2Y = row2;

    var pointDX = col3;
    var pointDY = row1;

    var pointQ3X = col4;
    var pointQ3Y = pointGY;

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = THEME_COLOR_BASIC;

    Path path = Path()
      ..moveTo(pointAX, pointAY)
      ..quadraticBezierTo(pointQ1X, pointQ1Y, pointBX, pointBY)
      ..lineTo(pointCX, pointCY)
      ..quadraticBezierTo(pointQ2X, pointQ2Y, pointDX, pointDY)
      ..quadraticBezierTo(
          pointQ3X, pointQ3Y, pointGX, pointGY)
      ..quadraticBezierTo(
          size.width - pointQ3X,
          pointQ3Y,
          size.width - pointDX,
          pointDY)
      ..quadraticBezierTo(size.width - pointQ2X, pointQ2Y,
          size.width - pointCX, pointCY)
      ..lineTo(size.width - pointBX, pointBY)
      ..quadraticBezierTo(size.width - pointQ1X, pointQ1Y,
          size.width - pointAX, pointAY)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, pointAY);
    canvas.drawShadow(path, Colors.black, 20.0, true);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
