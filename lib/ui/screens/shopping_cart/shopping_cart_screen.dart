import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/ui/clickable_icon.dart';
import 'package:food_delivery/ui/widgets/text/text_helper.dart';
import 'package:food_delivery/ui/widgets/top_bar.dart';
import 'package:food_delivery/utils/res/dimens.dart';
import 'package:food_delivery/utils/widgets_warehouse.dart';
import 'package:get/get.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();

  final _defaultVerticalPadding = PADDING_VERTICALLY;
  final _defaultHorizontalPadding = PADDING_HORIZONTALLY;

  final STR_YOUR_CART = "Your cart";
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: _shoppingCartScreen(),
      ),
    );
  }

  _shoppingCartScreen() {
    return Column(
      children: [
        _topBar(),
        SizedBox(height: widget._defaultVerticalPadding),
        _title(),
        SizedBox(height: widget._defaultVerticalPadding),
        _itemList()
      ],
    );
  }

  /// components in the screen
  _topBar() {
    return MainTopBar(
        startClickableIcon: ClickableIcon(
            onCLick: () => _navigateBack(), iconWidget: IC_LEFT_ARROW));
  }

  Widget _title() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: widget._defaultHorizontalPadding),
      child: Align(
          alignment: const Alignment(-1.0, 0.0),
          child: titleL(widget.STR_YOUR_CART)),
    );
  }

  _itemList() {
    return Flexible(
      flex: 1,
      child: Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          height: 60.0,
          color: Colors.blue),
    );
  }

  /// functions
  void _navigateBack() {
    Get.back();
  }
}
