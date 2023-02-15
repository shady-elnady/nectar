import 'dart:convert';

import '../../domain/Entities/payment_method.dart';

class PaymentMethodModel extends PaymentMethod {
  const PaymentMethodModel({
    required super.url,
    required super.name,
    required super.native,
    required super.emoji,
    required super.slug,
  });

  factory PaymentMethodModel.fromMap(Map<String, dynamic> data) =>
      PaymentMethodModel(
        url: data['url'] as String,
        name: data['name'] as String,
        native: data['native'] as String?,
        emoji: data['emoji'] as String?,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentMethodModel].
  factory PaymentMethodModel.fromJson(String data) {
    return PaymentMethodModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }
}
