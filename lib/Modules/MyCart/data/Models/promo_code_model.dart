import 'dart:convert';

import '../../domain/Entities/promo_code.dart';

class PromoCodeModel extends PromoCode {
  const PromoCodeModel({
    required super.url,
    required super.coupon,
    required super.discount,
    super.endTime,
    required super.createdDate,
    super.lastUpdated,
    required super.slug,
  });

  factory PromoCodeModel.fromMap(Map<String, dynamic> data) => PromoCodeModel(
        url: data['url'] as String,
        coupon: data['coupon'] as String,
        discount: data['discount'] as double,
        endTime: data['end_time'] as String?,
        createdDate: DateTime.parse(data['created_date'] as String),
        lastUpdated: data['last_updated'] == null
            ? null
            : DateTime.parse(data['last_updated'] as String),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PromoCode].
  factory PromoCodeModel.fromJson(String data) {
    return PromoCodeModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
