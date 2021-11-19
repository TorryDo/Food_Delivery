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

  Food changeToppingList({List<FoodToppings>? toppingList}) {
    return Food(imageUrl, name, price, rating, calories, isLiked, description,
        toppingList ?? this.toppingList);
  }
}

class FoodToppings {
  String url;
  String name;
  bool isChose;

  FoodToppings(this.url, this.name, this.isChose);

  FoodToppings copy({String? url, String? name, bool? isChose}) {
    return FoodToppings(
        url ?? this.url, name ?? this.name, isChose ?? this.isChose);
  }
}
