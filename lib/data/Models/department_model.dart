// To parse this JSON data, do
//
//     final department = departmentFromMap(jsonString);

import 'dart:convert';

import 'product_model.dart';

class Department {
  Department({
    this.url,
    required this.name,
    this.products,
    this.isFavorite,
    this.slug,
  });

  final String? url;
  final String name;
  final List<Product?>? products;
  final bool? isFavorite;
  final String? slug;

  Department copyWith({
    String? url,
    String? name,
    List<Product?>? products,
    bool? isFavorite,
    String? slug,
  }) =>
      Department(
        url: url ?? this.url,
        name: name ?? this.name,
        products: products ?? this.products,
        isFavorite: isFavorite ?? this.isFavorite,
        slug: slug ?? this.slug,
      );

  factory Department.fromJson(String str) =>
      Department.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Department.fromMap(Map<String, dynamic> json) => Department(
        url: json["url"],
        name: json["name"],
        products: json["products"] == null
            ? []
            : json["products"] == null
                ? []
                : List<Product?>.from(
                    json["products"]!.map((x) => Product.fromMap(x))),
        isFavorite: json["is_favorite"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "name": name,
        "products": products == null
            ? []
            : products == null
                ? []
                : List<dynamic>.from(products!.map((x) => x!.toMap())),
        "is_favorite": isFavorite,
        "slug": slug,
      };
}
