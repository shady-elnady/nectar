import 'dart:convert';

import '../../../../App/Entities/base_entity.dart';
import '../../../Category/domain/Entities/brand.dart';
import '../../../Category/domain/Entities/category.dart';
import 'currency.dart';
import 'product_image.dart';
import 'unit.dart';

class Product extends BaseEntity {
  final String image;
  final String? nutritions;
  final double amount;
  final double? reviews;
  final Brand? brand;
  final Category? category;
  final Unit? unit;
  final String? serial;
  final Currency currency;
  final double price;
  final String? detail;
  final bool? isFavorite;
  final List<ProductImage>? productImages;

  const Product({
    required super.url,
    required super.name,
    required this.image,
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
    required super.slug,
  });

  @override
  String toString() {
    return 'Product(url: $url, name: $name, image: $image, nutritions: $nutritions, amount: $amount, reviews: $reviews, brand: $brand, category: $category, unit: $unit, serial: $serial, currency: $currency, price: $price, detail: $detail, isFavorite: $isFavorite, productImages: $productImages, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [Product] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  @override
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
        'currency': currency.toMap(),
        'price': price,
        'detail': detail,
        'is_favorite': isFavorite,
        'product_images': productImages?.map((e) => e.toMap()).toList(),
        'slug': slug,
      };

  Product copyWith({
    required String url,
    required String name,
    required String image,
    String? nutritions,
    required double amount,
    double? reviews,
    Brand? brand,
    Category? category,
    Unit? unit,
    String? serial,
    required Currency currency,
    required double price,
    String? detail,
    bool? isFavorite,
    List<ProductImage>? productImages,
    required String slug,
  }) {
    return Product(
      url: this.url,
      name: this.name,
      image: this.image,
      nutritions: nutritions ?? this.nutritions,
      amount: this.amount,
      reviews: reviews ?? this.reviews,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      unit: unit ?? this.unit,
      serial: serial ?? this.serial,
      currency: this.currency,
      price: this.price,
      detail: detail ?? this.detail,
      isFavorite: isFavorite ?? this.isFavorite,
      productImages: productImages ?? this.productImages,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
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
