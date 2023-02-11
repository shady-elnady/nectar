import 'dart:convert';

import '../../domain/Entities/my_cart.dart';
import 'lines_in_my_cart_model.dart';
import 'promo_code_model.dart';

class MyCartModel extends MyCart {
  const MyCartModel({
    required super.url,
    required super.lineInMyCart,
    super.paymentMethod,
    super.promoCode,
    required super.isFinished,
    required super.createdAt,
    required super.totalCost,
    required super.slug,
  });

  factory MyCartModel.fromMap(Map<String, dynamic> data) => MyCartModel(
        url: data['url'] as String,
        lineInMyCart: (data['Line_In_My_Cart'] as List<dynamic>)
            .map((e) => LineInMyCartModel.fromMap(e as Map<String, dynamic>))
            .toList(),
        paymentMethod: data['payment_method'] as String?,
        promoCode: data['promo_code'] == null
            ? null
            : PromoCodeModel.fromMap(
                data['promo_code'] as Map<String, dynamic>),
        isFinished: data['is_finished'] as bool,
        createdAt: DateTime.parse(data['created_at'] as String),
        totalCost: (data['Total_Cost'] as num).toDouble(),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MyCartModel].
  factory MyCartModel.fromJson(String data) {
    return MyCartModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
