import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/ui/clickable_icon.dart';
import 'package:food_delivery/ui/clickable_icon.dart';
import 'package:food_delivery/ui/clickable_icon.dart';
import 'package:food_delivery/ui/clickable_icon.dart';
import 'package:food_delivery/ui/widgets/app_bar.dart';
import 'package:food_delivery/ui/widgets/bottom_navigation.dart';
import 'package:food_delivery/utils/res/dimens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return _homeScreen();
  }

  _homeScreen() {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            _appBar(),
            Flexible(flex: 3, child: Container(color: Colors.redAccent)),
            Flexible(flex: 5, child: Container(color: Colors.blue)),
            _bottomBar(),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return const MainAppBar();
  }

  _bottomBar() {
    final iconSize = ICON_SIZE_L;
    return MainBottomNavigation(fourClickableIcon: [
      ClickableIcon(onCLick: () {},
          iconWidget: SvgPicture.asset(
            'assets/icons/ic_home.svg', width: iconSize, height: iconSize,)),
      ClickableIcon(onCLick: () {},
          iconWidget: SvgPicture.asset(
              'assets/icons/ic_heart.svg', width: iconSize, height: iconSize)),
      ClickableIcon(onCLick: () {},
          iconWidget: SvgPicture.asset(
              'assets/icons/ic_bell.svg', width: iconSize, height: iconSize)),
      ClickableIcon(onCLick: () {},
          iconWidget: SvgPicture.asset(
              'assets/icons/ic_shopping_cart.svg', width: iconSize,
              height: iconSize))
    ],);
  }

// _foodCarousel(){
//   return
// }
}
