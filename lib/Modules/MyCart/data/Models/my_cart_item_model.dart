import 'dart:convert';

import '../../../Product/data/Models/product_model.dart';
import '../../domain/Entities/my_cart_item.dart';

class MyCartItemModel extends MyCartItem {
  const MyCartItemModel({
    required super.url,
    required super.myCart,
    required super.product,
    required super.amount,
    required super.myCartItemPrice,
    required super.createdDate,
    super.lastUpdated,
    required super.slug,
  });

  factory MyCartItemModel.fromMap(Map<String, dynamic> data) => MyCartItemModel(
        url: data['url'] as String,
        myCart: data['my_cart'] as String,
        product: ProductModel.fromMap(data['product'] as Map<String, dynamic>),
        amount: (data['amount'] as num).toDouble(),
        myCartItemPrice: (data['My_Cart_Item_Price'] as num).toDouble(),
        createdDate: DateTime.parse(data['created_date'] as String),
        lastUpdated: data['last_updated'] == null
            ? null
            : DateTime.parse(data['last_updated'] as String),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MyCartItemModel].
  factory MyCartItemModel.fromJson(String data) {
    return MyCartItemModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
