import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/data/food_api/model/food.dart';
import 'package:food_delivery/ui/clickable_icon.dart';
import 'package:food_delivery/ui/widgets/button/button_orange_fullwidth.dart';
import 'package:food_delivery/ui/widgets/text/text_helper.dart';
import 'package:food_delivery/ui/widgets/top_bar.dart';
import 'package:food_delivery/utils/device_spec.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:food_delivery/utils/res/dimens.dart';
import 'package:food_delivery/utils/widgets_warehouse.dart';
import 'package:get/get.dart';

class FoodDetailScreen extends StatefulWidget {
  FoodDetailScreen({Key? key}) : super(key: key);

  Food? _food;
  int _quantity = 1;

  Food _getFood() {
    if (_food != null) return _food!;
    try {
      _food = Get.arguments as Food;
      return _food!;
    } on Exception catch (e) {
      return Food('', '', 0, 0, 0, false, '', []);
    }
  }

  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();

  final _default_horizontal_space = 30.0;
  final _default_vertical_space = 20.0;

  final _TOPPING_FOR_YOU = "Toppings for you";
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
            Flexible(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: PADDING_VERTICALLY),
                    _imageView(),
                    const SizedBox(height: PADDING_VERTICALLY_XXL),
                    _titleAndInfo(),
                    const SizedBox(height: PADDING_VERTICALLY_XL),
                    _expandableDescription(),
                    const SizedBox(height: PADDING_VERTICALLY_XL),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: widget._default_horizontal_space),
                      child: Align(
                          alignment: const Alignment(-1.0, 0),
                          child: _quantityButton()),
                    ),
                    const SizedBox(height: PADDING_VERTICALLY_XXXL),
                    _toppingComponent(),
                    const SizedBox(height: PADDING_VERTICALLY_XXL),
                    _buttonAddToCart(),
                    const SizedBox(height: PADDING_VERTICALLY_XXL),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _topBar() => MainTopBar(
      startClickableIcon: ClickableIcon(
          onCLick: () => _onBackStack(), iconWidget: IC_LEFT_ARROW));

  Widget _imageView() {
    double size = getScreenWidth(context) * 0.65;

    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(BORDER_RADIUS_XL),
            color: THEME_COLOR_CORE,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ]),
        child: _loadMainImage());
  }

  _titleAndInfo() {
    final spacer = PADDING_VERTICALLY_S;
    final horizontalSpace = widget._default_horizontal_space + 10.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalSpace),
      child: Column(
        children: [
          titleL(widget._getFood().name),
          SizedBox(height: spacer),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _ratingStar(widget._getFood().rating),
            _calories(widget._getFood().calories),
          ]),
        ],
      ),
    );
  }

  Widget _expandableDescription() {
    var horizontalSpace = widget._default_horizontal_space;
    var fontSize = FONT_SIZE;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalSpace),
      child: Text(widget._getFood().description,
          maxLines: 4,
          style: TextStyle(color: TEXT_COLOR_LIGHTER, fontSize: fontSize)),
    );
  }

  Widget _quantityButton() {
    const buttonHeight = BUTTON_HEIGHT_XL;
    const buttonWidth = buttonHeight * 3;

    return Container(
      height: buttonHeight,
      width: buttonWidth,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        gradient: LinearGradient(
            colors: [
              MAIN_COLOR,
              MAIN_COLOR_DARKER,
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.5, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Row(
        children: [
          Flexible(flex: 1, child: _minusIcon()),
          Text(widget._quantity.toString(),
              style: const TextStyle(color: TEXT_COLOR_INVERSED)),
          Flexible(flex: 1, child: _plusIcon()),
        ],
      ),
    );
  }

  _toppingComponent() {
    const vSpacer = PADDING_VERTICALLY;

    final toppingList = widget._getFood().toppingList;
    log('list size = ${toppingList.length}');

    const toppingHeight = BUTTON_HEIGHT_XXL;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: widget._default_horizontal_space),
        child: titleM(widget._TOPPING_FOR_YOU),
      ),
      const SizedBox(height: vSpacer),
      SizedBox(
        width: double.infinity,
        height: toppingHeight,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: toppingList.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                  onTap: () => _onToppingClicked(i),
                  child: _itemTopping(toppingList[i]));
            }),
      )
    ]);
  }

  Widget _itemTopping(FoodToppings foodToppings) {
    const toppingWidth = BUTTON_HEIGHT * 4;

    const bodyColor = THEME_COLOR_CORE;

    final hPadding = widget._default_horizontal_space;
    final vPadding = PADDING_VERTICALLY_XS;

    const borderSize = 2.5;
    final borderColor = foodToppings.isChose ? MAIN_COLOR : bodyColor;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
      child: Container(
        width: toppingWidth,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  offset: const Offset(0, 0),
                  blurRadius: 5,
                  spreadRadius: 3)
            ],
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            border: Border.all(color: borderColor, width: borderSize),
            color: bodyColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _loadToppingIcon(foodToppings.url),
            Text(foodToppings.name,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: PADDING_HORIZONTALLY)
          ],
        ),
      ),
    );
  }

  Widget _buttonAddToCart() {
    return const ButtonOrangeFullWidth(text: 'Add to cart');
  }

  // --------------- functions -------------------
  void _onBackStack() {
    Get.back();
    print('back to home screen from food detail screen');
  }

  void _onToppingClicked(int position) {
    if (widget._food == null) return;
    try {
      bool tempChose = widget._food!.toppingList[position].isChose;

      setState(() {
        widget._food!.toppingList[position].isChose = !tempChose;
      });

      log('onToppignClicked');
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  // -------------- fake widget -------------------
  _loadMainImage() => Padding(
        padding: const EdgeInsets.all(PADDING_HORIZONTALLY_XL),
        child: Image.asset(widget._getFood().imageUrl),
      );

  _ratingStar(double stars) => Text('⭐ $stars');

  _calories(double calo) => Text('🔥 $calo cal');

  _loadToppingIcon(String link) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: SvgPicture.asset(link),
      );

  _minusIcon() => MaterialButton(
      child: const Text('-', style: TextStyle(color: TEXT_COLOR_INVERSED)),
      onPressed: () => setState(() {
            widget._quantity--;
          }));

  _plusIcon() => MaterialButton(
      child: const Text('+', style: TextStyle(color: TEXT_COLOR_INVERSED)),
      onPressed: () => setState(() {
            widget._quantity++;
          }));
}
