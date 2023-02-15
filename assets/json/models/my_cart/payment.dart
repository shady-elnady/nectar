import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'currency.dart';
import 'payment_method.dart';

class Payment extends Equatable {
  final String? url;
  final String? order;
  final PaymentMethod? paymentMethod;
  final String? chargeId;
  final Currency? currency;
  final double? amount;
  final DateTime? paymentTime;
  final String? slug;

  const Payment({
    this.url,
    this.order,
    this.paymentMethod,
    this.chargeId,
    this.currency,
    this.amount,
    this.paymentTime,
    this.slug,
  });

  factory Payment.fromMap(Map<String, dynamic> data) => Payment(
        url: data['url'] as String?,
        order: data['order'] as String?,
        paymentMethod: data['payment_method'] == null
            ? null
            : PaymentMethod.fromMap(
                data['payment_method'] as Map<String, dynamic>),
        chargeId: data['charge_id'] as String?,
        currency: data['currency'] == null
            ? null
            : Currency.fromMap(data['currency'] as Map<String, dynamic>),
        amount: (data['amount'] as num?)?.toDouble(),
        paymentTime: data['payment_time'] == null
            ? null
            : DateTime.parse(data['payment_time'] as String),
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'order': order,
        'payment_method': paymentMethod?.toMap(),
        'charge_id': chargeId,
        'currency': currency?.toMap(),
        'amount': amount,
        'payment_time': paymentTime?.toIso8601String(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Payment].
  factory Payment.fromJson(String data) {
    return Payment.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Payment] to a JSON string.
  String toJson() => json.encode(toMap());

  Payment copyWith({
    String? url,
    String? order,
    PaymentMethod? paymentMethod,
    String? chargeId,
    Currency? currency,
    double? amount,
    DateTime? paymentTime,
    String? slug,
  }) {
    return Payment(
      url: url ?? this.url,
      order: order ?? this.order,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      chargeId: chargeId ?? this.chargeId,
      currency: currency ?? this.currency,
      amount: amount ?? this.amount,
      paymentTime: paymentTime ?? this.paymentTime,
      slug: slug ?? this.slug,
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
