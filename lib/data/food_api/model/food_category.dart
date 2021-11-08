import 'package:food_delivery/data/food_api/model/food.dart';

class FoodCategory {
  String imageUrl;
  String name;
  List<Food> itemList;

  FoodCategory(this.imageUrl, this.name, this.itemList);
}
