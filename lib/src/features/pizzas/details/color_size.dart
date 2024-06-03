import 'package:flutter/material.dart';
import 'package:pizza/src/app/common/constants.dart';
import 'package:pizza/src/app/models/pizza_model.dart';

class ColorAndSizeWidget extends StatelessWidget {
  const ColorAndSizeWidget({super.key, required this.pizza});

  final Pizza pizza;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: kTextColor),
              children: [
                const TextSpan(text: "Taille\n"),
                TextSpan(
                  text: "40 cm",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
