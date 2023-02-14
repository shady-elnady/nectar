import 'dart:convert';

import 'package:nectar_mac/App/Entities/original_entity.dart';

import 'line_in_my_cart.dart';
import 'promo_code.dart';

class MyCart extends OriginalEntity {
  final List<LineInMyCart?> lineInMyCart;
  final String? paymentMethod;
  final PromoCode? promoCode;
  final bool isFinished;
  final DateTime createdAt;
  final double totalCost;

  const MyCart({
    required super.url,
    required this.lineInMyCart,
    this.paymentMethod,
    this.promoCode,
    required this.isFinished,
    required this.createdAt,
    required this.totalCost,
    required super.slug,
  });

  @override
  String toString() {
    return 'MyCart(url: $url, lineInMyCart: $lineInMyCart, paymentMethod: $paymentMethod, promoCode: $promoCode, isFinished: $isFinished, createdAt: $createdAt, totalCost: $totalCost, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [MyCart] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'Line_In_My_Cart': lineInMyCart.map((e) => e!.toMap()).toList(),
        'payment_method': paymentMethod,
        'promo_code': promoCode?.toMap(),
        'is_finished': isFinished,
        'created_at': createdAt.toIso8601String(),
        'Total_Cost': totalCost,
        'slug': slug,
      };

  MyCart copyWith({
    required String url,
    required List<LineInMyCart?> lineInMyCart,
    String? paymentMethod,
    PromoCode? promoCode,
    required bool isFinished,
    required DateTime createdAt,
    required double totalCost,
    required String slug,
  }) {
    return MyCart(
      url: this.url,
      lineInMyCart: this.lineInMyCart,
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
        lineInMyCart,
        paymentMethod,
        promoCode,
        isFinished,
        createdAt,
        totalCost,
        slug,
      ];
}
