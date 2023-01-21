// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:collection/collection.dart';

import 'product.dart';

@immutable
class LinesInCard {
  final String? url;
  final String? card;
  final Product? product;
  final int amount;
  final double totalLinePrice;
  final String? slug;

  const LinesInCard({
    this.url,
    this.card,
    this.product,
    required this.amount,
    required this.totalLinePrice,
    this.slug,
  });

  @override
  String toString() {
    return 'LinesInCard(url: $url, card: $card, product: $product, amount: $amount, totalLinePrice: $totalLinePrice, slug: $slug)';
  }

  factory LinesInCard.fromMap(Map<String, dynamic> data) => LinesInCard(
        url: data['url'] as String?,
        card: data['card'] as String?,
        product: data['product'] == null
            ? null
            : Product.fromMap(data['product'] as Map<String, dynamic>),
        amount: data['amount'] as int,
        totalLinePrice: (data['total_line_price'] as num).toDouble(),
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'card': card,
        'product': product?.toMap(),
        'amount': amount,
        'total_line_price': totalLinePrice,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LinesInCard].
  factory LinesInCard.fromJson(String data) {
    return LinesInCard.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LinesInCard] to a JSON string.
  String toJson() => json.encode(toMap());

  LinesInCard copyWith({
    String? url,
    String? card,
    Product? product,
    required int amount,
    required double totalLinePrice,
    String? slug,
  }) {
    return LinesInCard(
      url: url ?? this.url,
      card: card ?? this.card,
      product: product ?? this.product,
      amount: this.amount,
      totalLinePrice: this.totalLinePrice,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! LinesInCard) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      url.hashCode ^
      card.hashCode ^
      product.hashCode ^
      amount.hashCode ^
      totalLinePrice.hashCode ^
      slug.hashCode;
}
