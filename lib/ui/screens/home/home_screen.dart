import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/data/food_api/model/food.dart';
import 'package:food_delivery/data/food_api/model/food_category.dart';
import 'package:food_delivery/ui/clickable_icon.dart';
import 'package:food_delivery/ui/widgets/app_bar.dart';
import 'package:food_delivery/ui/widgets/bottom_navigation.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:food_delivery/utils/res/dimens.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

  final ENJOY_DELICIOUS_FOOD = 'Enjoy Delicious food';
  final POPULAR_RESTAURANTS = 'Popular restaurants';
  final VIEW_ALL = 'View all';

  final colorGreenLight = const Color(0x33A9E88B);
  final colorBorderGreen = const Color(0xFF3EC032);

  List<Food> getFakeFoodList() => [
        Food('assets/images/img_burger.png', 'Big cheese burger', 6, 4.5, 300,
            false, 'this burger is super delicious', []),
        Food('assets/images/img_burger.png', 'Big cheese burger', 6, 4.5, 300,
            false, 'this burger is super delicious', []),
        Food('assets/images/img_burger.png', 'Big cheese burger', 6, 4.5, 300,
            false, 'this burger is super delicious', []),
        Food('assets/images/img_burger.png', 'Big cheese burger', 6, 4.5, 300,
            false, 'this burger is super delicious', []),
      ];

  List<FoodCategory> getFakeFoodCategory() {
    return [
      FoodCategory('🍕', 'Pizza', getFakeFoodList()),
      FoodCategory('🍔', 'Burger', getFakeFoodList()),
      FoodCategory('🌭', 'Hotdog', getFakeFoodList()),
      FoodCategory('🌮', 'Taco', getFakeFoodList()),
      FoodCategory('🍜', 'Noodle', getFakeFoodList()),
      FoodCategory('🍗', 'Chicken', getFakeFoodList()),
      FoodCategory('🍿', 'Snack', getFakeFoodList()),
    ];
  }
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
            Flexible(flex: 2, child: _foodsOption()),
            Flexible(flex: 3, child: _foodsCarousel()),
            _bottomBar(),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return const MainAppBar();
  }

  _foodsOption() {
    return Column(
      children: [
        Flexible(
            flex: 1,
            child: _titleBar(widget.ENJOY_DELICIOUS_FOOD, FONT_SIZE_XXXL)),
        Flexible(
            flex: 3,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                /** FAKE FOOD CATEGORY HERE */
                for (var item in widget.getFakeFoodCategory())
                  _itemFoodOption(item.imageUrl, item.name)
              ],
            ))
      ],
    );
  }

  Widget _itemFoodOption(String uri, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: PADDING_HORIZONTALLY, vertical: PADDING_VERTICALLY),
      child: SizedBox(
        width: 130.0,
        height: 160.0,
        child: Opacity(
          opacity: 1.0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70.0),
                border: Border.all(color: widget.colorBorderGreen, width: 2.5),
                color: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70.0),
                    color: widget.colorGreenLight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SvgPicture.asset(uri),
                    Text(
                      uri,
                      style: const TextStyle(fontSize: FONT_SIZE_XXL),
                    ),
                    const SizedBox(
                      height: PADDING_VERTICALLY,
                    ),
                    Text(name)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _foodsCarousel() {
    return Column(
      children: [
        _titleBarViewAll(),
        Flexible(
            flex: 1,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                /** FAKE FOOD LIST HERE */
                for (var foodItem in widget.getFakeFoodList())
                  _ItemFoodCardView(foodItem)
              ],
            ))
      ],
    );
  }

  Widget _titleBarViewAll() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PADDING_HORIZONTALLY_L),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _title(widget.POPULAR_RESTAURANTS, FONT_SIZE_XXL),
        TextButton(
            onPressed: () {},
            child: Text(
              widget.VIEW_ALL,
              style: const TextStyle(color: Colors.orange),
            ))
      ]),
    );
  }

  _bottomBar() {
    const iconSize = ICON_SIZE_L;
    return MainBottomNavigation(
      fourClickableIcon: [
        ClickableIcon(
            onCLick: () {},
            iconWidget: SvgPicture.asset(
              'assets/icons/ic_home.svg',
              width: iconSize,
              height: iconSize,
            )),
        ClickableIcon(
            onCLick: () {},
            iconWidget: SvgPicture.asset('assets/icons/ic_heart.svg',
                width: iconSize, height: iconSize)),
        ClickableIcon(
            onCLick: () {},
            iconWidget: SvgPicture.asset('assets/icons/ic_bell.svg',
                width: iconSize, height: iconSize)),
        ClickableIcon(
            onCLick: () {},
            iconWidget: SvgPicture.asset('assets/icons/ic_shopping_cart.svg',
                width: iconSize, height: iconSize))
      ],
    );
  }

  // common widget ----------------------------

  _titleBar(String str, double fontSize) {
    final paddingHorizontally = PADDING_HORIZONTALLY_L;
    final paddingTop = PADDING_VERTICALLY_XS;

    return SizedBox(
        width: double.infinity,
        child: Padding(
            padding: EdgeInsets.only(
                left: paddingHorizontally,
                right: paddingHorizontally,
                top: paddingTop),
            child: _title(str, fontSize)));
  }

  _title(String str, double fontSize) {
    final textColor = TEXT_COLOR;
    return Text(
      str,
      overflow: TextOverflow.clip,
      style: TextStyle(
          color: textColor, fontWeight: FontWeight.bold, fontSize: fontSize),
      textAlign: TextAlign.start,
    );
  }
}

class _ItemFoodCardView extends StatefulWidget {
  final Food food;

  const _ItemFoodCardView(this.food, {Key? key}) : super(key: key);

  @override
  _ItemFoodCardViewState createState() => _ItemFoodCardViewState();
}

class _ItemFoodCardViewState extends State<_ItemFoodCardView> {
  @override
  Widget build(BuildContext context) {
    return _itemFood();
  }

  _itemFood() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: PADDING_HORIZONTALLY_L, vertical: PADDING_VERTICALLY),
      child: Container(
        width: 250.0,
        height: 300.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(40.0),
          color: THEME_COLOR_CORE,
        ),
        child: _cardBody(),
      ),
    );
  }

  _cardBody() {
    return Column(
      children: [
        Flexible(flex: 1, child: Image.asset(widget.food.imageUrl)),
        Text(widget.food.name),
        Text(widget.food.description,
            style: const TextStyle(fontSize: FONT_SIZE),
            overflow: TextOverflow.clip),
        const Text('⭐')
      ],
    );
  }
}
