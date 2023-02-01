import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../log/domain/Entities/user.dart';
import 'lines_in_card.dart';
import 'promo_code.dart';

class Cart extends Equatable {
  final String url;
  final User customer;
  final List<LinesInCard?> linesInCard;
  final String? paymentMethod;
  final PromoCode? promoCode;
  final bool isFinished;
  final DateTime createdAt;
  final double totalCost;
  final String slug;

  const Cart({
    required this.url,
    required this.customer,
    required this.linesInCard,
    this.paymentMethod,
    this.promoCode,
    required this.isFinished,
    required this.createdAt,
    required this.totalCost,
    required this.slug,
  });

  @override
  String toString() {
    return 'Cart(url: $url, customer: $customer, linesInCard: $linesInCard, paymentMethod: $paymentMethod, promoCode: $promoCode, isFinished: $isFinished, createdAt: $createdAt, totalCost: $totalCost, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [Cart] to a JSON string.
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'url': url,
        'customer': customer.toMap(),
        'Lines_In_Card': linesInCard.map((e) => e!.toMap()).toList(),
        'payment_method': paymentMethod,
        'promo_code': promoCode?.toMap(),
        'is_finished': isFinished,
        'created_at': createdAt.toIso8601String(),
        'Total_Cost': totalCost,
        'slug': slug,
      };

  Cart copyWith({
    required String url,
    required User customer,
    required List<LinesInCard?> linesInCard,
    String? paymentMethod,
    PromoCode? promoCode,
    required bool isFinished,
    required DateTime createdAt,
    required double totalCost,
    required String slug,
  }) {
    return Cart(
      url: this.url,
      customer: this.customer,
      linesInCard: this.linesInCard,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      promoCode: promoCode ?? this.promoCode,
      isFinished: this.isFinished,
      createdAt: this.createdAt,
      totalCost: this.totalCost,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        customer,
        linesInCard,
        paymentMethod,
        promoCode,
        isFinished,
        createdAt,
        totalCost,
        slug,
      ];
}