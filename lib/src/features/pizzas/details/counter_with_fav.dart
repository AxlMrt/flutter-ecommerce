import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cart_counter.dart';

class CounterWithFavBtn extends StatelessWidget {
  final Function(int) onQuantityChanged;
  final int initialQuantity;

  const CounterWithFavBtn(
      {super.key, required this.onQuantityChanged, this.initialQuantity = 1});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CartCounter(
          onQuantityChanged: onQuantityChanged,
          initialQuantity: initialQuantity,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          height: 32,
          width: 32,
          decoration: const BoxDecoration(
            color: Color(0xFFFF6464),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset("assets/icons/heart.svg"),
        )
      ],
    );
  }
}
