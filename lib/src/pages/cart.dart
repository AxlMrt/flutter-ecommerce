import 'package:flutter/material.dart';
import 'package:pizza/src/app/api/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Panier'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Votre panier est vide',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Retour au menu',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final cartItem = cart.items[index];
                return ListTile(
                  title: Text(cartItem.pizza.name),
                  subtitle: Text('Quantité: ${cartItem.quantity}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      cart.removeFromCart(cartItem.pizza);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
