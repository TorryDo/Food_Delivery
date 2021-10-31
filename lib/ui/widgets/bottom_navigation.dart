import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:food_delivery/utils/res/dimens.dart';
import 'package:food_delivery/utils/widgets_warehouse.dart';

class MainBottomNavigation extends StatefulWidget {
  final Function? mainButtonClick;

  const MainBottomNavigation({Key? key, this.mainButtonClick})
      : super(key: key);

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
        child: Stack(children: [
          _bottomBarLayout(),
          // _coupleButtons(),
          _mainButton(),
          // _coupleButtons()
        ]));
  }

  _bottomBarLayout() {
    return CustomPaint(
      size: Size(widget._bottomWidth, widget._bottomHeight),
      painter: RoundedBottomNavigationPainter(),
    );
  }

  _coupleButtons() {
    return Container(
      color: Colors.redAccent,
    );
  }

  _mainButton() {
    return Align(
        alignment: const Alignment(0.0, -1.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 3,
                blurRadius: 12,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            gradient:
                const LinearGradient(colors: [MAIN_COLOR, MAIN_COLOR_DARKER]),
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          ),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0.0,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15.0)),
              onPressed: () {
                if (widget.mainButtonClick != null) widget.mainButtonClick!();
              },
              child: IC_SEARCH()),
        ));
  }
}

class RoundedBottomNavigationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var row1 = size.height * 0.25;
    var row2 = size.height * 0.3;
    var row3 = size.height * 0.4;

    var col1 = size.width * 0.05;
    var col2 = size.width * 0.3;
    var col3 = size.width * 0.39;
    var col4 = size.width * 0.45;

    var pointGX = size.width * 0.5;
    var pointGY = size.height * 0.1;

    var pointAX = 0.0;
    var pointAY = row3;

    var pointBX = col1;
    var pointBY = row2;

    var pointCX = col2;
    var pointCY = row2;

    var pointDX = col3;
    var pointDY = row1;

    var pointQ1X = pointAX;
    var pointQ1Y = pointBY;

    var pointQ2X = col3 * 0.9;
    var pointQ2Y = row2;

    var pointQ3X = col4;
    var pointQ3Y = pointGY;

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = THEME_COLOR_BASIC;

    Path path = Path()
      ..moveTo(pointAX, pointAY) // A
      ..quadraticBezierTo(pointQ1X, pointQ1Y, pointBX, pointBY) // ^AB
      ..lineTo(pointCX, pointCY) // BC
      ..quadraticBezierTo(pointQ2X, pointQ2Y, pointDX, pointDY) // ^CD
      ..quadraticBezierTo(pointQ3X, pointQ3Y, pointGX, pointGY) // ^DG
      ..quadraticBezierTo(size.width - pointQ3X, pointQ3Y, size.width - pointDX,
          pointDY) // ^GD'
      ..quadraticBezierTo(
          size.width - pointQ2X, pointQ2Y, size.width - pointCX, pointCY)
      ..lineTo(size.width - pointBX, pointBY)
      ..quadraticBezierTo(
          size.width - pointQ1X, pointQ1Y, size.width - pointAX, pointAY)
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
