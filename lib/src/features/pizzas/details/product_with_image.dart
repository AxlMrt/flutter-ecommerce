import 'package:flutter/material.dart';
import 'package:pizza/src/app/common/constants.dart';
import 'package:pizza/src/app/models/pizza_model.dart';

class ProductTitleWithImageWidget extends StatelessWidget {
  const ProductTitleWithImageWidget({super.key, required this.pizza});

  final Pizza pizza;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            pizza.category,
            style: const TextStyle(color: kTextColor),
          ),
          Text(
            pizza.name,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: kTextColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Prix\n"),
                    TextSpan(
                      text: "\$${pizza.price}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: kTextColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: pizza.id,
                  child: Image.network(
                    pizza.image,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
