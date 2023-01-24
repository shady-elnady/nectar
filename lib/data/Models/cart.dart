// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:collection/collection.dart';

import 'User.dart';
import 'lines_in_card.dart';
import 'promo_code.dart';

@immutable
class Cart {
  final String? url;
  final User? customer;
  final List<LinesInCard?> linesInCard;
  final String? paymentMethod;
  final PromoCode? promoCode;
  final bool? isFinished;
  final DateTime? createdAt;
  final double? totalCost;
  final String? slug;

  const Cart({
    this.url,
    this.customer,
    required this.linesInCard,
    this.paymentMethod,
    this.promoCode,
    this.isFinished,
    this.createdAt,
    this.totalCost,
    this.slug,
  });

  @override
  String toString() {
    return 'Cart(url: $url, customer: $customer, linesInCard: $linesInCard, paymentMethod: $paymentMethod, promoCode: $promoCode, isFinished: $isFinished, createdAt: $createdAt, totalCost: $totalCost, slug: $slug)';
  }

  factory Cart.fromMap(Map<String, dynamic> data) => Cart(
        url: data['url'] as String?,
        customer: data['customer'] == null
            ? null
            : User.fromMap(data['customer'] as Map<String, dynamic>),
        linesInCard: (data['Lines_In_Card'] as List<dynamic>)
            .map((e) => LinesInCard.fromMap(e as Map<String, dynamic>))
            .toList(),
        paymentMethod: data['payment_method'] as String?,
        promoCode: data['promo_code'] == null
            ? null
            : PromoCode.fromMap(data['promo_code'] as Map<String, dynamic>),
        isFinished: data['is_finished'] as bool?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        totalCost: (data['Total_Cost'] as num?)?.toDouble(),
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'customer': customer?.toMap(),
        'Lines_In_Card': linesInCard.map((e) => e!.toMap()).toList(),
        'payment_method': paymentMethod,
        'promo_code': promoCode?.toMap(),
        'is_finished': isFinished,
        'created_at': createdAt?.toIso8601String(),
        'Total_Cost': totalCost,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Cart].
  factory Cart.fromJson(String data) {
    return Cart.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Cart] to a JSON string.
  String toJson() => json.encode(toMap());

  Cart copyWith({
    String? url,
    User? customer,
    required List<LinesInCard?> linesInCard,
    String? paymentMethod,
    PromoCode? promoCode,
    bool? isFinished,
    DateTime? createdAt,
    double? totalCost,
    String? slug,
  }) {
    return Cart(
      url: url ?? this.url,
      customer: customer ?? this.customer,
      linesInCard: this.linesInCard,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      promoCode: promoCode ?? this.promoCode,
      isFinished: isFinished ?? this.isFinished,
      createdAt: createdAt ?? this.createdAt,
      totalCost: totalCost ?? this.totalCost,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Cart) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      url.hashCode ^
      customer.hashCode ^
      linesInCard.hashCode ^
      paymentMethod.hashCode ^
      promoCode.hashCode ^
      isFinished.hashCode ^
      createdAt.hashCode ^
      totalCost.hashCode ^
      slug.hashCode;
}
