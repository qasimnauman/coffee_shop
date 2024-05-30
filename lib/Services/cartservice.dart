import 'package:coffee_shop/Models/coffeemodel.dart';
import 'package:coffee_shop/Models/colddrinksmodel.dart';

class CartService {
  List<CoffeeModel> cartItems = [];

  List<CoffeeModel> get cartItemss => cartItems;

  void addItem(CoffeeModel item) {
    cartItems.add(item);
  }

  void removeItem(CoffeeModel item) {
    cartItems.remove(item);
  }

  void clearCart() {
    cartItems.clear();
  }
}

class CartServiceCold {
  List<ColdDrinkModel> cartItems = [];

  List<ColdDrinkModel> get cartItemss => cartItems;

  void addItemcold(ColdDrinkModel item) {
    cartItems.add(item);
  }

  void removeItem(CoffeeModel item) {
    cartItems.remove(item);
  }

  void clearCart() {
    cartItems.clear();
  }
}

final CartService cartService = CartService();
