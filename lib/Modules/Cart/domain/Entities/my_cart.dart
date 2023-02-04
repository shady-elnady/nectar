import 'dart:convert';

import 'package:nectar_mac/App/Entities/original_entity.dart';

import 'lines_in_my_card.dart';
import 'promo_code.dart';

class MyCart extends OriginalEntity {
  final List<LinesInMyCard?> linesInMyCard;
  final String? paymentMethod;
  final PromoCode? promoCode;
  final bool isFinished;
  final DateTime createdAt;
  final double totalCost;

  const MyCart({
    required super.url,
    required this.linesInMyCard,
    this.paymentMethod,
    this.promoCode,
    required this.isFinished,
    required this.createdAt,
    required this.totalCost,
    required super.slug,
  });

  @override
  String toString() {
    return 'MyCart(url: $url, linesInMyCard: $linesInMyCard, paymentMethod: $paymentMethod, promoCode: $promoCode, isFinished: $isFinished, createdAt: $createdAt, totalCost: $totalCost, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [MyCart] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'Lines_In_Card': linesInMyCard.map((e) => e!.toMap()).toList(),
        'payment_method': paymentMethod,
        'promo_code': promoCode?.toMap(),
        'is_finished': isFinished,
        'created_at': createdAt.toIso8601String(),
        'Total_Cost': totalCost,
        'slug': slug,
      };

  MyCart copyWith({
    required String url,
    required List<LinesInMyCard?> linesInMyCard,
    String? paymentMethod,
    PromoCode? promoCode,
    required bool isFinished,
    required DateTime createdAt,
    required double totalCost,
    required String slug,
  }) {
    return MyCart(
      url: this.url,
      linesInMyCard: this.linesInMyCard,
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
        linesInMyCard,
        paymentMethod,
        promoCode,
        isFinished,
        createdAt,
        totalCost,
        slug,
      ];
}
