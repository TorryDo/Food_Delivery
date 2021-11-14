import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/ui/clickable_icon.dart';
import 'package:food_delivery/ui/widgets/top_bar.dart';
import 'package:food_delivery/utils/widgets_warehouse.dart';
import 'package:get/get.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({Key? key}) : super(key: key);

  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return _foodDetailScreen();
  }

  _foodDetailScreen() {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            _topBar(),
            Container(color: Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _topBar() => MainTopBar(
      startClickableIcon: ClickableIcon(
          onCLick: () {
            Get.back();
            print('back to backstack');
          },
          iconWidget: IC_LEFT_ARROW));
}
