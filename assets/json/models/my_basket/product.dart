import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'brand.dart';
import 'category.dart';
import 'currency.dart';
import 'product_image.dart';
import 'unit.dart';

class Product extends Equatable {
  final String? url;
  final String? name;
  final String? image;
  final String? nutritions;
  final int? amount;
  final int? reviews;
  final Brand? brand;
  final Category? category;
  final Unit? unit;
  final String? serial;
  final Currency? currency;
  final double? price;
  final String? detail;
  final bool? isFavorite;
  final List<ProductImage>? productImages;
  final String? slug;

  const Product({
    this.url,
    this.name,
    this.image,
    this.nutritions,
    this.amount,
    this.reviews,
    this.brand,
    this.category,
    this.unit,
    this.serial,
    this.currency,
    this.price,
    this.detail,
    this.isFavorite,
    this.productImages,
    this.slug,
  });

  factory Product.fromMap(Map<String, dynamic> data) => Product(
        url: data['url'] as String?,
        name: data['name'] as String?,
        image: data['image'] as String?,
        nutritions: data['nutritions'] as String?,
        amount: data['amount'] as int?,
        reviews: data['reviews'] as int?,
        brand: data['brand'] == null
            ? null
            : Brand.fromMap(data['brand'] as Map<String, dynamic>),
        category: data['category'] == null
            ? null
            : Category.fromMap(data['category'] as Map<String, dynamic>),
        unit: data['unit'] == null
            ? null
            : Unit.fromMap(data['unit'] as Map<String, dynamic>),
        serial: data['serial'] as String?,
        currency: data['currency'] == null
            ? null
            : Currency.fromMap(data['currency'] as Map<String, dynamic>),
        price: (data['price'] as num?)?.toDouble(),
        detail: data['detail'] as String?,
        isFavorite: data['is_favorite'] as bool?,
        productImages: (data['product_images'] as List<dynamic>?)
            ?.map((e) => ProductImage.fromMap(e as Map<String, dynamic>))
            .toList(),
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'image': image,
        'nutritions': nutritions,
        'amount': amount,
        'reviews': reviews,
        'brand': brand?.toMap(),
        'category': category?.toMap(),
        'unit': unit?.toMap(),
        'serial': serial,
        'currency': currency?.toMap(),
        'price': price,
        'detail': detail,
        'is_favorite': isFavorite,
        'product_images': productImages?.map((e) => e.toMap()).toList(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Product].
  factory Product.fromJson(String data) {
    return Product.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Product] to a JSON string.
  String toJson() => json.encode(toMap());

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
    List<ProductImage>? productImages,
    String? slug,
  }) {
    return Product(
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
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      url,
      name,
      image,
      nutritions,
      amount,
      reviews,
      brand,
      category,
      unit,
      serial,
      currency,
      price,
      detail,
      isFavorite,
      productImages,
      slug,
    ];
  }
}
