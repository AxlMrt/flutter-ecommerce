import 'package:flutter/material.dart';
import 'package:pizza/src/app/api/pizza_api.dart';
import 'package:pizza/src/app/common/constants.dart';
import 'package:provider/provider.dart';
import 'pizza_list_item.dart';

class PizzaListWidget extends StatelessWidget {
  const PizzaListWidget({super.key});

  Widget getErrorUI(String error) {
    return Text('Error: $error');
  }

  Widget getLoadingUI() {
    return const CircularProgressIndicator();
  }

  Widget getBodyUI(pizza) {
    return PizzaListItemWidget(pizza: pizza);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PizzeProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(kDefaultPaddin),
          child: GridView.builder(
            itemCount: provider.pizze.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: kDefaultPaddin,
              crossAxisSpacing: kDefaultPaddin,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return provider.isLoading
                  ? getLoadingUI()
                  : provider.error.isNotEmpty
                      ? getErrorUI(provider.error)
                      : getBodyUI(provider.pizze[index]);
            },
          ),
        );
      },
    );
  }
}
