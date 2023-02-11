import 'dart:convert';

import '../../../Product/data/Models/product_model.dart';
import '../../domain/Entities/line_in_my_cart.dart';
import 'my_cart_model.dart';

class LineInMyCartModel extends LineInMyCart {
  const LineInMyCartModel({
    required super.url,
    required super.myCart,
    required super.product,
    required super.amount,
    required super.totalLinePrice,
    required super.slug,
  });

  factory LineInMyCartModel.fromMap(Map<String, dynamic> data) =>
      LineInMyCartModel(
        url: data['url'] as String,
        myCart: MyCartModel.fromMap(data['my_cart'] as Map<String, dynamic>),
        product: ProductModel.fromMap(data['product'] as Map<String, dynamic>),
        amount: data['amount'] as int,
        totalLinePrice: (data['total_line_price'] as num).toDouble(),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LineInMyCartModel].
  factory LineInMyCartModel.fromJson(String data) {
    return LineInMyCartModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
