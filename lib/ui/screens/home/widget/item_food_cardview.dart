import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/data/food_api/model/food.dart';
import 'package:food_delivery/utils/res/colors.dart';
import 'package:food_delivery/utils/res/dimens.dart';

class ItemFoodCardView extends StatefulWidget {
  final Food food;

  final FAKE_FOOD_PRICE = "69,9 \$";

  const ItemFoodCardView(this.food, {Key? key}) : super(key: key);

  @override
  _ItemFoodCardViewState createState() => _ItemFoodCardViewState();
}

class _ItemFoodCardViewState extends State<ItemFoodCardView> {
  @override
  Widget build(BuildContext context) {
    return _itemFood();
  }

  Widget _itemFood() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: PADDING_HORIZONTALLY_L, vertical: PADDING_VERTICALLY),
      child: Container(
        width: 250.0,
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

  Widget _cardBody() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(PADDING_HORIZONTALLY_L),
              child: Image.asset(widget.food.imageUrl),
            ),
            _title(widget.food.name, fontSize: FONT_SIZE_XL),
            _title(widget.FAKE_FOOD_PRICE,
                isBold: true, fontSize: FONT_SIZE_XXL),
            const SizedBox(height: PADDING_VERTICALLY_XXS),
            Row(children: [
              _star(),
              const SizedBox(width: PADDING_HORIZONTALLY_XXXS),
              _starNumber(stars: 4.5)
            ]),
            const SizedBox(height: PADDING_VERTICALLY_XXS)
          ]),
    );
  }

  _star() => const Text('⭐');

  _starNumber({double? stars}) {
    String starNumber = stars != null ? stars.toString() : '?';

    return _title(starNumber, fontSize: FONT_SIZE);
  }

  _title(String str, {double? fontSize, bool? isBold}) {
    final fsize = fontSize ?? FONT_SIZE_L;
    final textBold = isBold != null ? FontWeight.bold : null;

    return Text(str,
        style: TextStyle(fontWeight: textBold, fontSize: fsize),
        overflow: TextOverflow.clip);
  }
}
