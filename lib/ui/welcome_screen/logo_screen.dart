import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({Key? key}) : super(key: key);

  final double logoSize = 100.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SvgPicture.asset(
          'assets/icons/ic_applogo.svg',
          semanticsLabel: 'app logo',
          width: logoSize,
          height: logoSize,
        ),
      ),
    );
  }
}
