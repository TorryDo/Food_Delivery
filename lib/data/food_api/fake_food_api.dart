import 'package:food_delivery/data/food_api/model/food.dart';
import 'package:food_delivery/data/food_api/model/food_category.dart';

Future<String> getFakeFoodApi() async {

  await Future.delayed(const Duration(seconds: 1));

  List<FoodCategory> foodCategoryList = [];

  List<FoodToppings> fakeFoodToppings = [
    FoodToppings('🧀', 'Cheese', false),
    FoodToppings('🥥', 'Coconut', false),
    FoodToppings('🥚', 'Egg', false),
    FoodToppings('🍅', 'Tomato', false),
    FoodToppings('🍎', 'Apple', false),
    FoodToppings('🍊', 'Orange', false),
  ];

  foodCategoryList.add(FoodCategory("🍔", "Hamburger", [
    Food(
        'assets/images/img_burger.png',
        'Big cheese burger',
        69.99,
        4.9,
        300,
        false,
        'Our simple classic cheeseburger begins with a 100% pure...',
        fakeFoodToppings),
    Food(
        'assets/images/img_burger.png',
        'Big cheese burger',
        69.99,
        4.9,
        300,
        false,
        'Our simple classic cheeseburger begins with a 100% pure...',
        fakeFoodToppings),
    Food(
        'assets/images/img_burger.png',
        'Big cheese burger',
        69.99,
        4.9,
        300,
        false,
        'Our simple classic cheeseburger begins with a 100% pure...',
        fakeFoodToppings),
    Food(
        'assets/images/img_burger.png',
        'Big cheese burger',
        69.99,
        4.9,
        300,
        false,
        'Our simple classic cheeseburger begins with a 100% pure...',
        fakeFoodToppings),
  ]));

  foodCategoryList.add(FoodCategory("🍔", "Hamburger", [
    Food(
        'assets/images/img_burger.png',
        'Big cheese burger',
        69.99,
        4.9,
        300,
        false,
        'Our simple classic cheeseburger begins with a 100% pure...',
        fakeFoodToppings),
    Food(
        'assets/images/img_burger.png',
        'Big cheese burger',
        69.99,
        4.9,
        300,
        false,
        'Our simple classic cheeseburger begins with a 100% pure...',
        fakeFoodToppings),
    Food(
        'assets/images/img_burger.png',
        'Big cheese burger',
        69.99,
        4.9,
        300,
        false,
        'Our simple classic cheeseburger begins with a 100% pure...',
        fakeFoodToppings),
    Food(
        'assets/images/img_burger.png',
        'Big cheese burger',
        69.99,
        4.9,
        300,
        false,
        'Our simple classic cheeseburger begins with a 100% pure...',
        fakeFoodToppings),
  ]));
  foodCategoryList.add(FoodCategory("🍔", "Hamburger", [
    Food(
        'assets/images/img_burger.png',
        'Big cheese burger',
        69.99,
        4.9,
        300,
        false,
        'Our simple classic cheeseburger begins with a 100% pure...',
        fakeFoodToppings),
    Food(
        'assets/images/img_burger.png',
        'Big cheese burger',
        69.99,
        4.9,
        300,
        false,
        'Our simple classic cheeseburger begins with a 100% pure...',
        fakeFoodToppings),
    Food(
        'assets/images/img_burger.png',
        'Big cheese burger',
        69.99,
        4.9,
        300,
        false,
        'Our simple classic cheeseburger begins with a 100% pure...',
        fakeFoodToppings),
    Food(
        'assets/images/img_burger.png',
        'Big cheese burger',
        69.99,
        4.9,
        300,
        false,
        'Our simple classic cheeseburger begins with a 100% pure...',
        fakeFoodToppings),
  ]));

  return foodCategoryList.toString();
}
