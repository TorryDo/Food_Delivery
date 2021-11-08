import 'package:food_delivery/data/food_api/food_api_adapter.dart';
import 'package:food_delivery/data/food_api/model/food.dart';

class FoodRepository{

  final FoodApiAdapter foodApiAdapter;

  FoodRepository(this.foodApiAdapter);

  // Future<List<List<Food>>> getFoodCategory() async{
  //   var resList = await foodApiAdapter.getFoodCategory();
  //   return resList;
  // }

}