import 'dart:convert';

import '../../../Category/data/Models/category_model.dart';
import '../../domain/Entities/product.dart';
import 'brand_model.dart';
import 'currency_model.dart';
import 'product_image_model.dart';
import 'unit_model.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.url,
    required super.name,
    required super.image,
    super.nutritions,
    required super.amount,
    super.reviews,
    super.brand,
    super.category,
    super.unit,
    super.serial,
    required super.currency,
    required super.price,
    super.detail,
    super.isFavorite,
    super.productImages,
    required super.slug,
  });

  @override
  String toString() {
    return 'Product(url: $url, name: $name, image: $image, nutritions: $nutritions, amount: $amount, reviews: $reviews, brand: $brand, category: $category, unit: $unit, serial: $serial, currency: $currency, price: $price, detail: $detail, isFavorite: $isFavorite, productImages: $productImages, slug: $slug)';
  }

  factory ProductModel.fromMap(Map<String, dynamic> data) => ProductModel(
        url: data['url'] as String,
        name: data['name'] as String,
        image: data['image'] as String,
        nutritions: data['nutritions'] as String?,
        amount: (data['amount'] as num).toDouble(),
        reviews: (data['reviews'] as num?)?.toDouble(),
        brand: data['brand'] == null
            ? null
            : BrandModel.fromMap(data['brand'] as Map<String, dynamic>),
        category: data['category'] == null
            ? null
            : CategoryModel.fromMap(data['category'] as Map<String, dynamic>),
        unit: data['unit'] == null
            ? null
            : UnitModel.fromMap(data['unit'] as Map<String, dynamic>),
        serial: data['serial'] as String?,
        currency:
            CurrencyModel.fromMap(data['currency'] as Map<String, dynamic>),
        price: (data['price'] as num).toDouble(),
        detail: data['detail'] as String?,
        isFavorite: data['is_favorite'] as bool?,
        productImages: (data['product_images'] as List<dynamic>?)
            ?.map((e) => ProductImageModel.fromMap(e as Map<String, dynamic>))
            .toList(),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductModel].
  factory ProductModel.fromJson(String data) {
    return ProductModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
