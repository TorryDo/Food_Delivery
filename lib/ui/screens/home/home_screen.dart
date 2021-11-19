import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/data/food_api/model/food.dart';
import 'package:food_delivery/data/food_api/model/food_category.dart';
import 'package:food_delivery/ui/clickable_icon.dart';
import 'package:food_delivery/ui/screens/home/widget/item_food_cardview.dart';
import 'package:food_delivery/ui/widgets/bottom_navigation.dart';
import 'package:food_delivery/ui/widgets/top_bar.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:food_delivery/utils/res/dimens.dart';
import 'package:food_delivery/utils/route_keys.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

  final ENJOY_DELICIOUS_FOOD = 'Enjoy Delicious food';
  final POPULAR_RESTAURANTS = 'Popular restaurants';
  final VIEW_ALL = 'View all >';

  final colorGreenLight = const Color(0x33A9E88B);
  final colorBorderGreen = const Color(0xFF3EC032);

  var _userChoseNumber = 0;

  List<FoodToppings> getFakeToppingList(){
    const defaultIcon = 'assets/icons/ic_applogo.svg';
    return [
      FoodToppings(defaultIcon, 'Cheese', false),
      FoodToppings(defaultIcon, 'Cheese', false),
      FoodToppings(defaultIcon, 'Cheese', false),
      FoodToppings(defaultIcon, 'Cheese', false),
      FoodToppings(defaultIcon, 'Cheese', false),
      FoodToppings(defaultIcon, 'Cheese', false),
      FoodToppings(defaultIcon, 'Cheese', false),
    ];
  }

  List<Food> getFakeFoodList() {
    var superLongText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rutrum tincidunt ligula nec pretium. Morbi eleifend felis ipsum, sed rutrum sem iaculis ac. Mauris vel urna non diam interdum vehicula. Phasellus et tempor enim. Sed ut elit mauris. Quisque nec luctus augue. Vivamus fermentum purus odio, quis ultricies libero convallis et. Nullam ac mollis nunc, quis dignissim augue.";
    return [
        Food('assets/images/img_burger.png', 'Big cheese burger', 6, 4.5, 300,
            false, superLongText, getFakeToppingList()),
        Food('assets/images/img_burger.png', 'Medium apple burger', 6, 4.5, 300,
            false, superLongText, getFakeToppingList()),
        Food('assets/images/img_burger.png', 'Small beef burger', 6, 4.5, 300,
            false, superLongText, getFakeToppingList()),
        Food('assets/images/img_burger.png', 'Unexist pork burger', 6, 4.5, 300,
            false, superLongText, getFakeToppingList()),
      ];
  }

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
            _topBar(),
            Flexible(flex: 3, child: _topComponent()),
            Flexible(flex: 5, child: _bottomComponent()),
            _bottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return MainTopBar();
  }

  _topComponent() {
    var myList = widget.getFakeFoodCategory();
    return Column(
      children: [
        Flexible(
            flex: 1,
            child: _titleBar(widget.ENJOY_DELICIOUS_FOOD, FONT_SIZE_XXXL)),
        Flexible(
            flex: 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: myList.length,
              itemBuilder: (BuildContext context, int index) {
                return _itemFoodOption(
                    myList[index].imageUrl, myList[index].name, index);
              },
            ))
      ],
    );
  }

  Widget _itemFoodOption(String uri, String name, int position) {
    var currentPosition = widget._userChoseNumber;

    var opacity = (currentPosition == position) ? 1.0 : 0.7;

    var textBoldOrNot = (currentPosition == position)
        ? Text(name, style: const TextStyle(fontWeight: FontWeight.bold))
        : Text(name);

    var borderColor =
        (currentPosition == position) ? widget.colorBorderGreen : GREY;
    var bodyColor =
        (currentPosition == position) ? widget.colorGreenLight : GREY_LIGHTER;

    return GestureDetector(
      onTap: () {
        setState(() {
          widget._userChoseNumber = position;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: PADDING_HORIZONTALLY, vertical: PADDING_VERTICALLY),
        child: SizedBox(
          width: 120.0,
          child: Opacity(
            opacity: opacity,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70.0),
                  border: Border.all(color: borderColor, width: 2.5),
                  color: Colors.transparent),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70.0),
                      color: bodyColor),
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
                      textBoldOrNot
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _bottomComponent() {
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
                  GestureDetector(
                      onTap: () => _navigateToFoodDetailScreen(foodItem),
                      child: ItemFoodCardView(foodItem))
              ],
            ))
      ],
    );
  }

  _titleBarViewAll() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PADDING_HORIZONTALLY_L),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _title(widget.POPULAR_RESTAURANTS, FONT_SIZE_XXL),
        TextButton(
            onPressed: () {},
            child: Text(
              widget.VIEW_ALL,
              style: const TextStyle(
                  color: Colors.orange, decoration: TextDecoration.underline),
            ))
      ]),
    );
  }

  Widget _bottomBar() {
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
            iconWidget: SvgPicture.asset('assets/icons/ic_user.svg',
                width: iconSize, height: iconSize))
      ],
    );
  }

  // common widget ----------------------------

  _titleBar(String str, double fontSize) {
    const paddingHorizontally = PADDING_HORIZONTALLY_L;
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

  // navigate functions
  void _navigateToFoodDetailScreen(Food food) {
    Get.toNamed(FOOD_DETAIL_SCREEN_KEY, arguments: food);
  }

  void _navigateToShoppingCartScreen(){

  }
}
