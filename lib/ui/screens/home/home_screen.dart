import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/data/food_api/model/food.dart';
import 'package:food_delivery/ui/clickable_icon.dart';
import 'package:food_delivery/ui/widgets/app_bar.dart';
import 'package:food_delivery/ui/widgets/bottom_navigation.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:food_delivery/utils/res/dimens.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ENJOY_DELICIOUS_FOOD = 'Enjoy Delicious food';
  final POPULAR_RESTAURANTS = 'Popular restaurants';
  final VIEW_ALL = 'View all';

  final FAKE_OPTIONS = [
    'Pizza',
    'Burger',
    'Sausage',
    'Taco',
    'Banhmi',
    'Sandwich',
    'Pizza',
    'Burger',
    'Sausage',
    'Taco',
    'Banhmi',
    'Sandwich'
  ];

  final FAKE_TOPPINGS = [
    FoodToppings('🧀', 'Cheese', false),
    FoodToppings('🥥', 'Coconut', false),
    FoodToppings('🥚', 'Egg', false),
    FoodToppings('🍅', 'Tomato', false),
    FoodToppings('🍎', 'Apple', false),
    FoodToppings('🍊', 'Orange', false),
  ];

  final FAKE_FOOD = Food(
      'assets/images/img_burger.png',
      'Big cheese burger',
      69.99,
      4.5,
      300,
      false,
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      []);

  final colorGreenLight = const Color(0x33A9E88B);
  final colorBorderGreen = const Color(0xFF3EC032);

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
                for (var str in widget.FAKE_OPTIONS) _itemFoodOption('🍔', str)
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
                for (var str in widget.FAKE_OPTIONS)
                  _itemFoodCarousel(widget.FAKE_FOOD.imageUrl, str, 'super delicious', 4.5, true)
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

  Widget _itemFoodCarousel(String uri, String name, String description,
      double rating, bool isLiked) {
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
        child: _cardFood(uri, name, description, rating, isLiked),
      ),
    );
  }

  Widget _cardFood(String uri, String name, String description, double rating,
      bool isLiked) {
    return Column(
      children: [
        Flexible(flex: 1,child: Image.asset(uri)),
        Text(name),
        Text(description, style: const TextStyle(fontSize: FONT_SIZE), overflow: TextOverflow.clip),
        const Text('⭐')
      ],
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
