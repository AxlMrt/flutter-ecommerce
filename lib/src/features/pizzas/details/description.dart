import 'package:flutter/material.dart';
import 'package:pizza/src/app/common/constants.dart';
import 'package:pizza/src/app/models/pizza_model.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.pizza});

  final Pizza pizza;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        pizza.ingredients.join(', '),
        style: const TextStyle(height: 1.5),
      ),
    );
  }
}
