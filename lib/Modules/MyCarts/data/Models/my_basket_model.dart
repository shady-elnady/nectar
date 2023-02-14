import 'dart:convert';

import '../../domain/Entities/my_basket.dart';
import 'my_basket_item_model.dart';

class MyBasketModel extends MyBasket {
  const MyBasketModel({
    super.url,
    required super.myBasketItems,
    super.createdDate,
    super.lastUpdated,
    super.slug,
  }) : super.initialize();

  factory MyBasketModel.fromMap(Map<String, dynamic> data) => MyBasketModel(
        url: data['url'] as String?,
        myBasketItems: (data['My_Basket_Items'] as List<dynamic>?)!
            .map((e) => MyBasketItemModel.fromMap(e as Map<String, dynamic>))
            .toList(),
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
  /// Parses the string and returns the resulting Json object as [MyBasketModel].
  factory MyBasketModel.fromJson(String data) {
    return MyBasketModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
