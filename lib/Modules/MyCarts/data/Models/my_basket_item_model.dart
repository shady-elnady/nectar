import 'dart:convert';

import '../../../Product/data/Models/product_model.dart';
import '../../domain/Entities/my_basket_item.dart';
import 'my_basket_model.dart';

class MyBasketItemModel extends MyBasketItem {
  const MyBasketItemModel({
    super.url,
    required super.myBasket,
    required super.product,
    required super.amount,
    super.totalItemPrice,
    super.createdDate,
    super.lastUpdated,
    super.slug,
  });

  factory MyBasketItemModel.fromMap(Map<String, dynamic> data) =>
      MyBasketItemModel(
        url: data['url'] as String?,
        myBasket:
            MyBasketModel.fromMap(data['my_basket'] as Map<String, dynamic>),
        product: ProductModel.fromMap(data['product'] as Map<String, dynamic>),
        amount: data['amount'] as int,
        totalItemPrice: (data['total_item_price'] as num?)?.toDouble(),
        createdDate: data['created_date'] == null
            ? null
            : DateTime.parse(data['created_date'] as String),
        lastUpdated: data['last_updated'] == null
            ? null
            : DateTime.parse(data['last_updated'] as String),
        slug: data['slug'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MyBasketItemModel].
  factory MyBasketItemModel.fromJson(String data) {
    return MyBasketItemModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  @override
  List<Object?> get props {
    return [
      url,
      myBasket,
      product,
      amount,
      totalItemPrice,
      createdDate,
      lastUpdated,
      slug,
    ];
  }
}
