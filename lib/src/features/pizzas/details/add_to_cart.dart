import 'package:flutter/material.dart';
import 'package:pizza/src/app/common/constants.dart';
import 'package:pizza/src/app/models/pizza_model.dart';
import 'package:pizza/src/app/api/cart_provider.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatelessWidget {
  final Pizza pizza;
  final int quantity;

  const AddToCart({super.key, required this.pizza, required this.quantity});

  void _showSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('${pizza.name} (x$quantity) a été ajouté au panier.'),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.blue,
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .addToCart(pizza, quantity);
                _showSnackbar(context);
              },
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .addToCart(pizza, quantity);
                _showSnackbar(context);
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  backgroundColor: Colors.blue),
              child: Text(
                "Acheter maintenant".toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
