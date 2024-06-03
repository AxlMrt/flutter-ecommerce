import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizza/src/app/api/api_urls.dart';
import 'package:pizza/src/app/models/pizza_model.dart';

class PizzeProvider extends ChangeNotifier {
  final pizzeUrl = APIUrls().pizzaUrl;
  bool isLoading = true;
  String error = '';
  List<Pizza> pizze = [];
  late Pizza singlePizza;

  Future<void> fetchPizze() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get("$pizzeUrl/items/pizzas");
      if (response.statusCode == 200) {
        final data = response.data;
        final List<dynamic> pizzaJsonList = data['data'];

        // GET images url for each pizza
        for (var pizza in pizzaJsonList) {
          pizza['image'] = "$pizzeUrl/assets/${pizza['image']}";
        }

        pizze =
            pizzaJsonList.map<Pizza>((json) => Pizza.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load pizze: ${response.statusCode}');
      }
    } catch (e) {
      error = e.toString();
      throw Exception('Error retrieving pizze: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchPizzaDetails(String pizzaId) async {
    try {
      Dio dio = Dio();
      Response response = await dio.get("$pizzeUrl/items/pizzas/$pizzaId");
      if (response.statusCode == 200) {
        final data = response.data;
        final pizzaJson = data['data'];

        print(pizzaJson);
        pizzaJson['image'] = "$pizzeUrl/assets/${pizzaJson['image']}";

        singlePizza = Pizza.fromJson(pizzaJson);
      } else {
        throw Exception('Failed to load pizze: ${response.statusCode}');
      }
    } catch (e) {
      error = e.toString();
      throw Exception('Error retrieving pizze: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
