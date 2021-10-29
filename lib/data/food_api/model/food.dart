import 'dart:ffi';

class Food {
  String url;
  String name;
  Float price;
  Float rating;
  Float calories;
  bool isFavorited;
  String description;
  int quantity;
  List<FoodToppings> toppingList;

  Food(this.url, this.name, this.price, this.rating, this.calories,
      this.isFavorited, this.description, this.quantity, this.toppingList);
}

class FoodToppings {
  String url;
  String name;
  bool isChose;

  FoodToppings(this.url, this.name, this.isChose);
}
