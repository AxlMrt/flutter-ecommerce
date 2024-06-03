// models/cart_item.dart
import 'package:pizza/src/app/models/pizza_model.dart';

class CartItem {
  final Pizza pizza;
  int quantity;

  CartItem({
    required this.pizza,
    this.quantity = 1,
  });
}
