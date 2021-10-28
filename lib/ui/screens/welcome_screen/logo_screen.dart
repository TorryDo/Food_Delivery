import 'package:flutter/material.dart';
import 'package:food_delivery/ui/screens/welcome_screen/first_launch_screen.dart';
import 'package:food_delivery/utils/widgets_warehouse.dart';
import 'package:get/get.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  final double logoSize = 100.0;

  final _DELAY_TIME = 2000;

  // @override
  // void initState() {
  //   super.initState();
  //   _navigate();
  // }

  _navigate() async {
    await Future.delayed(Duration(milliseconds: _DELAY_TIME), () {});
    Get.to(() => const FirstLaunchScreen());
  }

  @override
  Widget build(BuildContext context) {
    return _logoScreen();
  }

  _delayedScreen() {
    return FutureBuilder(
        future: _navigate(),
        builder: _logoScreen()
    );
  }

  _logoScreen() {
    return Container(
      color: Colors.white,
      child: Center(
        child: LOGO(),
      ),
    );
  }
}
