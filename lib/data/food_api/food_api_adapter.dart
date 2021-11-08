
import 'package:food_delivery/data/food_api/fake_food_api.dart';
import 'package:food_delivery/data/food_api/model/food_category.dart';

abstract class FoodApiAdapter{
  Future<List<List<FoodCategory>>> getFoodCategory();
}

class FoodApiAdapterImpl implements FoodApiAdapter{

  @override
  Future<List<List<FoodCategory>>> getFoodCategory() async{

    final fakeFoodApi = await getFakeFoodApi();

    print(fakeFoodApi);

    return [[], [], []];
  }

}