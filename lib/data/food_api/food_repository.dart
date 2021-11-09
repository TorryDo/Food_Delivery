import 'dart:developer';

import 'package:food_delivery/data/food_api/food_api_adapter.dart';
import 'package:food_delivery/data/food_api/model/food_category.dart';

class FoodRepository{

  final FoodApiAdapter foodApiAdapter;

  FoodRepository(this.foodApiAdapter);

  List<List<FoodCategory>> getFoodCategory(){
    dynamic res;
    try{
      res = foodApiAdapter.getFoodCategory();
    }catch(e){
      log('sh*t');
    }

    return [];
  }

}