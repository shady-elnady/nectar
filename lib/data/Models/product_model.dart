// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

import 'brand_model.dart';
import 'category_model.dart';
import 'currency_model.dart';
import 'unit_model.dart';

class Product {
  Product({
    this.url,
    required this.name,
    this.image,
    this.nutritions,
    required this.amount,
    this.reviews,
    this.brand,
    this.category,
    this.unit,
    this.serial,
    required this.currency,
    required this.price,
    this.detail,
    this.isFavorite,
    this.productImages,
    this.slug,
  });

  final String? url;
  final String name;
  final String? image;
  final String? nutritions;
  final int amount;
  final int? reviews;
  final Brand? brand;
  final Category? category;
  final Unit? unit;
  final String? serial;
  final Currency currency;
  final double price;
  final String? detail;
  final bool? isFavorite;
  final List<ProductImage?>? productImages;
  final String? slug;

  Product copyWith({
    String? url,
    String? name,
    String? image,
    String? nutritions,
    int? amount,
    int? reviews,
    Brand? brand,
    Category? category,
    Unit? unit,
    String? serial,
    Currency? currency,
    double? price,
    String? detail,
    bool? isFavorite,
    List<ProductImage?>? productImages,
    String? slug,
  }) =>
      Product(
        url: url ?? this.url,
        name: name ?? this.name,
        image: image ?? this.image,
        nutritions: nutritions ?? this.nutritions,
        amount: amount ?? this.amount,
        reviews: reviews ?? this.reviews,
        brand: brand ?? this.brand,
        category: category ?? this.category,
        unit: unit ?? this.unit,
        serial: serial ?? this.serial,
        currency: currency ?? this.currency,
        price: price ?? this.price,
        detail: detail ?? this.detail,
        isFavorite: isFavorite ?? this.isFavorite,
        productImages: productImages ?? this.productImages,
        slug: slug ?? this.slug,
      );

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        url: json["url"],
        name: json["name"],
        image: json["image"],
        nutritions: json["nutritions"],
        amount: json["amount"],
        reviews: json["reviews"],
        brand: json["brand"],
        category: json["category"],
        unit: json["unit"],
        serial: json["serial"],
        currency: json["currency"],
        price: json["price"],
        detail: json["detail"],
        isFavorite: json["is_favorite"],
        productImages: json["product_images"] == null
            ? []
            : json["product_images"] == null
                ? []
                : List<ProductImage?>.from(json["product_images"]!
                    .map((x) => ProductImage.fromMap(x))),
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "name": name,
        "image": image,
        "nutritions": nutritions,
        "amount": amount,
        "reviews": reviews,
        "brand": brand,
        "category": category,
        "unit": unit,
        "serial": serial,
        "currency": currency,
        "price": price,
        "detail": detail,
        "is_favorite": isFavorite,
        "product_images": productImages == null
            ? []
            : productImages == null
                ? []
                : List<dynamic>.from(productImages!.map((x) => x!.toMap())),
        "slug": slug,
      };
}

class ProductImage {
  ProductImage({
    this.url,
    required this.image,
    required this.product,
  });

  final String? url;
  final String image;
  final String product;

  ProductImage copyWith({
    String? url,
    String? image,
    String? product,
  }) =>
      ProductImage(
        url: url ?? this.url,
        image: image ?? this.image,
        product: product ?? this.product,
      );

  factory ProductImage.fromJson(String str) =>
      ProductImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductImage.fromMap(Map<String, dynamic> json) => ProductImage(
        url: json["url"],
        image: json["image"],
        product: json["product"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "image": image,
        "product": product,
      };
}
