import 'package:flutter/material.dart';

class HorizontalListWidget extends StatelessWidget {
  const HorizontalListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          GestureDetector(
            onTap: () {}, // Image tapped
            child: Image.network(
              "https://media.istockphoto.com/id/938742222/fr/photo/pizza-pepperoni-fromage.jpg?s=612x612&w=0&k=20&c=tw9bdSLONUwGPvksAAiBHKHnyuVDGo_DYtH50n0Zt0U=",
              fit: BoxFit.cover, // Fixes border issues
              width: 130.0,
              height: 130.0,
            ),
          ),
          GestureDetector(
            onTap: () {}, // Image tapped
            child: Image.network(
              "https://media.istockphoto.com/id/938742222/fr/photo/pizza-pepperoni-fromage.jpg?s=612x612&w=0&k=20&c=tw9bdSLONUwGPvksAAiBHKHnyuVDGo_DYtH50n0Zt0U=",
              fit: BoxFit.cover, // Fixes border issues
              width: 130.0,
              height: 130.0,
            ),
          ),
          GestureDetector(
            onTap: () {}, // Image tapped
            child: Image.network(
              "https://media.istockphoto.com/id/938742222/fr/photo/pizza-pepperoni-fromage.jpg?s=612x612&w=0&k=20&c=tw9bdSLONUwGPvksAAiBHKHnyuVDGo_DYtH50n0Zt0U=",
              fit: BoxFit.cover, // Fixes border issues
              width: 130.0,
              height: 130.0,
            ),
          ),
          GestureDetector(
            onTap: () {}, // Image tapped
            child: Image.network(
              "https://media.istockphoto.com/id/938742222/fr/photo/pizza-pepperoni-fromage.jpg?s=612x612&w=0&k=20&c=tw9bdSLONUwGPvksAAiBHKHnyuVDGo_DYtH50n0Zt0U=",
              fit: BoxFit.cover, // Fixes border issues
              width: 130.0,
              height: 130.0,
            ),
          ),
        ],
      ),
    );
  }
}
