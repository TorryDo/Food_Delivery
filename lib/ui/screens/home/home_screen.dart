import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/ui/widgets/app_bar.dart';
import 'package:food_delivery/ui/widgets/bottom_navigation.dart';

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

  _appBar(){
    return const MainAppBar();
  }

  _bottomBar(){
    return const MainBottomNavigation();
  }

  // _foodCarousel(){
  //   return
  // }
}
