import 'dart:ffi';

class Food {
  String imageUrl;
  String name;
  double price;
  double rating;
  double calories;
  bool isLiked;
  String description;
  List<FoodToppings> toppingList;

  Food(this.imageUrl, this.name, this.price, this.rating, this.calories,
      this.isLiked, this.description, this.toppingList);
}

class FoodToppings {
  String url;
  String name;
  bool isChose;

  FoodToppings(this.url, this.name, this.isChose);
}
