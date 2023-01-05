// To parse this JSON data, do
//
//     final department = departmentFromMap(jsonString);
import 'dart:convert';

import 'brand_model.dart';
import 'category_model.dart';
import 'currency_model.dart';
import 'unit_model.dart';

class Product {
  Product({
    required this.name,
    this.detail,
    this.review,
    this.nutritions,
    required this.unit,
    required this.amount,
    required this.price,
    required this.currency,
    this.brand,
    this.category,
    required this.images,
  });

  final String name;
  final String? detail;
  final double? review;
  final String? nutritions;
  final Unit unit;
  final double amount;
  final double price;
  final Currency currency;
  final Brand? brand;
  final Category? category;
  final List<ProductImage> images;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        name: json["name"],
        detail: json["detail"],
        review: json["review"].toDouble(),
        nutritions: json["nutritions"],
        unit: Unit.fromMap(json["unit"]),
        amount: json["amount"].toDouble(),
        price: json["price"].toDouble(),
        currency: Currency.fromMap(json["currency"]),
        brand: Brand.fromMap(json["brand"]),
        category: Category.fromMap(json["category"]),
        images: List<ProductImage>.from(
            json["images"].map((x) => ProductImage.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "detail": detail,
        "review": review,
        "nutritions": nutritions,
        "unit": unit.toMap(),
        "amount": amount,
        "price": price,
        "currency": currency.toMap(),
        "brand": brand!.toMap(),
        "category": category!.toMap(),
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
      };
}

class ProductImage {
  ProductImage({
    required this.product,
    required this.image,
  });

  final Product product;
  final String image;

  factory ProductImage.fromJson(String str) =>
      ProductImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductImage.fromMap(Map<String, dynamic> json) => ProductImage(
        product: Product.fromMap(json["product"]),
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "product": product.toMap(),
        "image": image,
      };
}
