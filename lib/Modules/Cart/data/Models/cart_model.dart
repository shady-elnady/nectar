import 'dart:convert';

import '../../../log/data/Models/user_model.dart';
import '../../domain/Entities/cart.dart';
import 'lines_in_card_model.dart';
import 'promo_code_model.dart';

class CartModel extends Cart {
  const CartModel({
    required super.url,
    required super.customer,
    required super.linesInCard,
    super.paymentMethod,
    super.promoCode,
    required super.isFinished,
    required super.createdAt,
    required super.totalCost,
    required super.slug,
  });

  factory CartModel.fromMap(Map<String, dynamic> data) => CartModel(
        url: data['url'] as String,
        customer: UserModel.fromMap(data['customer'] as Map<String, dynamic>),
        linesInCard: (data['Lines_In_Card'] as List<dynamic>)
            .map((e) => LinesInCardModel.fromMap(e as Map<String, dynamic>))
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
  /// Parses the string and returns the resulting Json object as [CartModel].
  factory CartModel.fromJson(String data) {
    return CartModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
