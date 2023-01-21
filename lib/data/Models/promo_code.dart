// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:collection/collection.dart';

@immutable
class PromoCode {
  final String? url;
  final String? promoCode;
  final double discount;
  final String? slug;

  const PromoCode({
    this.url,
    this.promoCode,
    required this.discount,
    this.slug,
  });

  @override
  String toString() {
    return 'PromoCode(url: $url, promoCode: $promoCode, discount: $discount, slug: $slug)';
  }

  factory PromoCode.fromMap(Map<String, dynamic> data) => PromoCode(
        url: data['url'] as String?,
        promoCode: data['promo_code'] as String?,
        discount: data['discount'] as double,
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'promo_code': promoCode,
        'discount': discount,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PromoCode].
  factory PromoCode.fromJson(String data) {
    return PromoCode.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PromoCode] to a JSON string.
  String toJson() => json.encode(toMap());

  PromoCode copyWith({
    String? url,
    String? promoCode,
    required double discount,
    String? slug,
  }) {
    return PromoCode(
      url: url ?? this.url,
      promoCode: promoCode ?? this.promoCode,
      discount: this.discount,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PromoCode) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      url.hashCode ^ promoCode.hashCode ^ discount.hashCode ^ slug.hashCode;
}
