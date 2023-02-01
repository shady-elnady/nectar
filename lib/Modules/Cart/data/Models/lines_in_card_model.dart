import 'dart:convert';

import '../../../Product/data/Models/product_model.dart';
import '../../domain/Entities/lines_in_card.dart';

class LinesInCardModel extends LinesInCard {
  const LinesInCardModel({
    required super.url,
    required super.card,
    required super.product,
    required super.amount,
    required super.totalLinePrice,
    required super.slug,
  });

  factory LinesInCardModel.fromMap(Map<String, dynamic> data) =>
      LinesInCardModel(
        url: data['url'] as String,
        card: data['card'] as String,
        product: ProductModel.fromMap(data['product'] as Map<String, dynamic>),
        amount: data['amount'] as int,
        totalLinePrice: (data['total_line_price'] as num).toDouble(),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LinesInCardModel].
  factory LinesInCardModel.fromJson(String data) {
    return LinesInCardModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
