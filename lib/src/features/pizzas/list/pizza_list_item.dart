import 'package:flutter/material.dart';
import 'package:pizza/src/app/common/constants.dart';
import 'package:pizza/src/app/models/pizza_model.dart';

class PizzaListItemWidget extends StatelessWidget {
  const PizzaListItemWidget({super.key, required this.pizza});

  static const double imageSize = 150.0;
  final Pizza pizza;

  Widget getImageUI(String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPaddin),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Hero(
        tag: pizza.id,
        child: Image.network(imageUrl),
      ),
    );
  }

  Widget getCardTitleUI(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
      child: Text(
        // products is out demo list
        name,
        style: const TextStyle(color: kTextLightColor),
      ),
    );
  }

  Widget getCardPriceUI(int price) {
    return Text(
      "\$${pizza.price}",
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/pizza/${pizza.id}');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getImageUI(pizza.image),
            getCardTitleUI(pizza.name),
            getCardPriceUI(pizza.price)
          ],
        ));
  }
}
