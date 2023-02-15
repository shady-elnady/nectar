import 'dart:convert';

import 'package:nectar_mac/App/Entities/sub_base_entity.dart';

import '../../../Product/domain/Entities/currency.dart';
import 'payment_method.dart';

class Payment extends SubBaseEntity {
  final String order;
  final PaymentMethod paymentMethod;
  final String chargeId;
  final Currency currency;
  final double amount;
  final DateTime paymentTime;

  const Payment({
    required super.url,
    required this.order,
    required this.paymentMethod,
    required this.chargeId,
    required this.currency,
    required this.amount,
    required this.paymentTime,
    required super.slug,
  });

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'order': order,
        'payment_method': paymentMethod.toMap(),
        'charge_id': chargeId,
        'currency': currency.toMap(),
        'amount': amount,
        'payment_time': paymentTime.toIso8601String(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [Payment] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  Payment copyWith({
    required String url,
    required String order,
    required PaymentMethod paymentMethod,
    required String chargeId,
    required Currency currency,
    required double amount,
    required DateTime paymentTime,
    required String slug,
  }) {
    return Payment(
      url: this.url,
      order: this.order,
      paymentMethod: this.paymentMethod,
      chargeId: this.chargeId,
      currency: this.currency,
      amount: this.amount,
      paymentTime: this.paymentTime,
      slug: this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      url,
      order,
      paymentMethod,
      chargeId,
      currency,
      amount,
      paymentTime,
      slug,
    ];
  }
}
