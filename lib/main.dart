import 'package:flutter/material.dart';
import 'package:pizza/app.dart';
import 'package:pizza/src/app/api/cart_provider.dart';
import 'package:pizza/src/app/api/pizza_api.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PizzeProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
    ],
    child: const MainApp(),
  ));
}
