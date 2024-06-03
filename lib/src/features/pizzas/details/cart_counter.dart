import 'package:flutter/material.dart';
import 'package:pizza/src/app/common/constants.dart';

class CartCounter extends StatefulWidget {
  final Function(int) onQuantityChanged;
  final int initialQuantity;

  const CartCounter(
      {super.key, required this.onQuantityChanged, this.initialQuantity = 1});

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  late int numOfItems;

  @override
  void initState() {
    super.initState();
    numOfItems = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40,
          height: 32,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {
              setState(() {
                if (numOfItems > 1) {
                  numOfItems--;
                }
                widget.onQuantityChanged(numOfItems);
              });
            },
            child: const Icon(Icons.remove),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(
          width: 40,
          height: 32,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {
              setState(() {
                numOfItems++;
                widget.onQuantityChanged(numOfItems);
              });
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
