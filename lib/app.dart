import 'package:flutter/material.dart';
import 'package:pizza/src/app/common/constants.dart';
import 'package:pizza/src/features/pizzas/details/pizza_details.dart';
import 'package:pizza/src/pages/cart.dart';
import 'package:pizza/src/pages/home.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Napoli',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeWidget(),
        '/cart': (context) => const CartPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name != null && settings.name!.startsWith('/pizza/')) {
          final id = settings.name!.split('/').last;
          return MaterialPageRoute(
            builder: (context) => PizzaDetailsWidget(id: id),
          );
        }
        return null; // Return null for undefined routes to let MaterialApp handle them.
      },
    );
  }
}
