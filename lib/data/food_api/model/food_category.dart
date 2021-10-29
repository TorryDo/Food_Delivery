import 'package:food_delivery/data/food_api/model/food.dart';

class FoodCategory {
  String imageUrl;
  String imageTitle;
  List<Food> itemList;

  FoodCategory(this.imageUrl, this.imageTitle, this.itemList);
}
