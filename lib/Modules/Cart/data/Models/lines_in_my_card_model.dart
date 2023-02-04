import 'dart:convert';

import '../../../Department/data/Models/product_model.dart';
import '../../domain/Entities/lines_in_my_card.dart';

class LinesInMyCardModel extends LinesInMyCard {
  const LinesInMyCardModel({
    required super.url,
    required super.card,
    required super.product,
    required super.amount,
    required super.totalLinePrice,
    required super.slug,
  });

  factory LinesInMyCardModel.fromMap(Map<String, dynamic> data) =>
      LinesInMyCardModel(
        url: data['url'] as String,
        card: data['card'] as String,
        product: ProductModel.fromMap(data['product'] as Map<String, dynamic>),
        amount: data['amount'] as int,
        totalLinePrice: (data['total_line_price'] as num).toDouble(),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LinesInMyCardModel].
  factory LinesInMyCardModel.fromJson(String data) {
    return LinesInMyCardModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }
}
