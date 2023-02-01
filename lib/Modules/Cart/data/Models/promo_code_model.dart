import 'dart:convert';

import '../../domain/Entities/promo_code.dart';

class PromoCodeModel extends PromoCode {
  const PromoCodeModel({
    required super.url,
    required super.promoCode,
    required super.discount,
    required super.slug,
  });

  factory PromoCodeModel.fromMap(Map<String, dynamic> data) => PromoCodeModel(
        url: data['url'] as String,
        promoCode: data['promo_code'] as String,
        discount: data['discount'] as double,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PromoCodeModel].
  factory PromoCodeModel.fromJson(String data) {
    return PromoCodeModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
