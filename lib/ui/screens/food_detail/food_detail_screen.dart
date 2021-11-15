import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/data/food_api/model/food.dart';
import 'package:food_delivery/ui/clickable_icon.dart';
import 'package:food_delivery/ui/widgets/text/title_l.dart';
import 'package:food_delivery/ui/widgets/top_bar.dart';
import 'package:food_delivery/utils/device_spec.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:food_delivery/utils/res/dimens.dart';
import 'package:food_delivery/utils/widgets_warehouse.dart';
import 'package:get/get.dart';

class FoodDetailScreen extends StatefulWidget {
  FoodDetailScreen({Key? key}) : super(key: key);

  Food? _food;

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
                    _expandableDescription()
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

  Widget _quantityButton(){
    return
  }

  // --------------- functions -------------------
  void _onBackStack() {
    Get.back();
    print('back to home screen from food detail screen');
  }

  // -------------- fake widget -------------------
  _loadMainImage() => Padding(
        padding: const EdgeInsets.all(PADDING_HORIZONTALLY_XL),
        child: Image.asset(widget._getFood().imageUrl),
      );

  _ratingStar(double stars) => Text('⭐ $stars');

  _calories(double calo) => Text('🔥 $calo cal');
}
