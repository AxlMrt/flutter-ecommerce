// providers/cart_provider.dart
import 'package:flutter/material.dart';
import 'package:pizza/src/app/models/cart_item_model.dart';
import 'package:pizza/src/app/models/pizza_model.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Pizza pizza, int quantity) {
    for (var item in _items) {
      if (item.pizza.id == pizza.id) {
        item.quantity += quantity;
        notifyListeners();
        return;
      }
    }
    _items.add(CartItem(pizza: pizza, quantity: quantity));
    notifyListeners();
  }

  void removeFromCart(Pizza pizza) {
    _items.removeWhere((item) => item.pizza.id == pizza.id);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
