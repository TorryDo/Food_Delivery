
import 'dart:convert';

import 'package:food_delivery/data/food_api/fake_food_api.dart';
import 'package:food_delivery/data/food_api/model/food_category.dart';

abstract class FoodApiAdapter{
  List<FoodCategory> getFoodCategory();
}

class FoodApiAdapterImpl implements FoodApiAdapter{

  @override
  List<FoodCategory> getFoodCategory() {

    // final fakeFoodApi = jsonDecode(getFakeFoodApi(), List<FoodCategory>);


    return [];
  }

}