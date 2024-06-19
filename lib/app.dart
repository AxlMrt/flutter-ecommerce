import 'package:flutter/material.dart';
import 'package:pizza/src/app/common/constants.dart';
import 'package:pizza/src/app/guard/auth_guard.dart';
import 'package:pizza/src/features/pizzas/details/pizza_details.dart';
import 'package:pizza/src/pages/cart.dart';
import 'package:pizza/src/pages/home.dart';
import 'package:pizza/src/pages/login.dart';
import 'package:pizza/src/pages/register.dart';

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
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPageWidget(),
        '/register': (context) => const RegisterPageWidget(),
        '/home': (context) => const AuthGuard(child: HomeWidget()),
        '/cart': (context) => const AuthGuard(child: CartPage()),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name != null && settings.name!.startsWith('/pizza/')) {
          final id = settings.name!.split('/').last;
          return MaterialPageRoute(
            builder: (context) => AuthGuard(child: PizzaDetailsWidget(id: id)),
          );
        }
        return null;
      },
    );
  }
}
