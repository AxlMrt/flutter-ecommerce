import 'package:flutter/material.dart';
import 'package:pizza/src/app/api/pizza_api.dart';
import 'package:pizza/src/app/common/constants.dart';
import 'package:pizza/src/features/pizzas/details/add_to_cart.dart';
import 'package:pizza/src/features/pizzas/details/color_size.dart';
import 'package:pizza/src/features/pizzas/details/counter_with_fav.dart';
import 'package:pizza/src/features/pizzas/details/description.dart';
import 'package:pizza/src/features/pizzas/details/product_with_image.dart';
import 'package:provider/provider.dart';

class PizzaDetailsWidget extends StatefulWidget {
  const PizzaDetailsWidget({super.key, required this.id});
  final String id;

  @override
  State<PizzaDetailsWidget> createState() => _PizzaDetailsWidgetState();
}

class _PizzaDetailsWidgetState extends State<PizzaDetailsWidget> {
  int selectedQuantity = 1;

  @override
  void initState() {
    Provider.of<PizzeProvider>(context, listen: false)
        .fetchPizzaDetails(widget.id);
    super.initState();
  }

  void updateQuantity(int quantity) {
    setState(() {
      selectedQuantity = quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Details'),
      ),
      body: Consumer<PizzeProvider>(builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.3),
                      padding: EdgeInsets.only(
                        top: size.height * 0.12,
                        left: kDefaultPaddin,
                        right: kDefaultPaddin,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          ColorAndSizeWidget(pizza: provider.singlePizza),
                          const SizedBox(height: kDefaultPaddin / 2),
                          Description(pizza: provider.singlePizza),
                          const SizedBox(height: kDefaultPaddin / 2),
                          CounterWithFavBtn(onQuantityChanged: updateQuantity),
                          const SizedBox(height: kDefaultPaddin / 2),
                          AddToCart(
                              pizza: provider.singlePizza,
                              quantity: selectedQuantity),
                        ],
                      ),
                    ),
                    ProductTitleWithImageWidget(pizza: provider.singlePizza)
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
