import 'dart:convert';

import 'product_model.dart';

class Department {
  Department({
    required this.title,
    required this.products,
  });

  final String title;
  final List<Product> products;

  factory Department.fromJson(String str) =>
      Department.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Department.fromMap(Map<String, dynamic> json) => Department(
        title: json["title"],
        products:
            List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
      };
}
