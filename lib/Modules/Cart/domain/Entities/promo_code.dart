import 'dart:convert';

import 'package:equatable/equatable.dart';

class PromoCode extends Equatable {
  final String url;
  final String promoCode;
  final double discount;
  final String slug;

  const PromoCode({
    required this.url,
    required this.promoCode,
    required this.discount,
    required this.slug,
  });

  @override
  String toString() {
    return 'PromoCode(url: $url, promoCode: $promoCode, discount: $discount, slug: $slug)';
  }

  Map<String, dynamic> toMap() => {
        'url': url,
        'promo_code': promoCode,
        'discount': discount,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [PromoCode] to a JSON string.
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
