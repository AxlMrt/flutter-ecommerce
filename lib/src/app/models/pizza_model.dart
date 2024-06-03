class Pizza {
  String id;
  String name;
  int price;
  String base;
  List<String> ingredients;
  String image;
  String category;
  List<int> elements;

  Pizza({
    required this.id,
    required this.name,
    required this.price,
    required this.base,
    required this.ingredients,
    required this.image,
    required this.category,
    required this.elements,
  });

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as int,
      base: json['base'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      image: json['image'] as String,
      category: json['category'] as String,
      elements:
          (json['elements'] as List<dynamic>).map((e) => e as int).toList(),
    );
  }
}
