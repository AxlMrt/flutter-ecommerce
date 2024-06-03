import 'package:flutter/material.dart';
import 'package:pizza/src/app/api/pizza_api.dart';
import 'package:pizza/src/features/app_bar/app_bar.dart';
import 'package:pizza/src/features/banner/banner.dart';
import 'package:pizza/src/features/drawers/app_drawer.dart';
import 'package:pizza/src/features/pizzas/list/pizza_list.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  static const String bannerImage = "images/home_banner.png";

  @override
  void initState() {
    Provider.of<PizzeProvider>(context, listen: false).fetchPizze();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, 'Home page', {}),
      drawer: const AppDrawerWidget(),
      body: const Column(
        children: [
          BannerWidget(imageSrc: bannerImage),
          Expanded(child: PizzaListWidget()),
        ],
      ),
    );
  }
}
