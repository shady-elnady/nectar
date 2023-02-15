import 'dart:convert';

import '../../../Product/data/Models/currency_model.dart';
import '../../domain/Entities/payment.dart';
import 'payment_method_model.dart';

class PaymentModel extends Payment {
  const PaymentModel({
    required super.url,
    required super.order,
    required super.paymentMethod,
    required super.chargeId,
    required super.currency,
    required super.amount,
    required super.paymentTime,
    required super.slug,
  });

  factory PaymentModel.fromMap(Map<String, dynamic> data) => PaymentModel(
        url: data['url'] as String,
        order: data['order'] as String,
        paymentMethod: PaymentMethodModel.fromMap(
          data['payment_method'] as Map<String, dynamic>,
        ),
        chargeId: data['charge_id'] as String,
        currency:
            CurrencyModel.fromMap(data['currency'] as Map<String, dynamic>),
        amount: (data['amount'] as num).toDouble(),
        paymentTime: DateTime.parse(data['payment_time'] as String),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentModel].
  factory PaymentModel.fromJson(String data) {
    return PaymentModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
