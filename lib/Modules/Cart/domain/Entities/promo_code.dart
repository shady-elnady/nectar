import 'dart:convert';

import 'package:nectar_mac/App/Entities/original_entity.dart';

class PromoCode extends OriginalEntity {
  final String promoCode;
  final double discount;

  const PromoCode({
    required super.url,
    required this.promoCode,
    required this.discount,
    required super.slug,
  });

  @override
  String toString() {
    return 'PromoCode(url: $url, promoCode: $promoCode, discount: $discount, slug: $slug)';
  }

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'promo_code': promoCode,
        'discount': discount,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [PromoCode] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  PromoCode copyWith({
    required String url,
    required String promoCode,
    required double discount,
    required String slug,
  }) {
    return PromoCode(
      url: this.url,
      promoCode: this.promoCode,
      discount: this.discount,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        promoCode,
        discount,
        slug,
      ];
}
