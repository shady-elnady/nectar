import 'dart:convert';

import '../../domain/Entities/my_cart.dart';
import 'my_cart_item_model.dart';
import 'order_model.dart';

class MyCartModel extends MyCart {
  const MyCartModel({
    required super.url,
    required super.myCartItems,
    required super.isFinished,
    required super.totalMyCartCost,
    required super.order,
    required super.createdDate,
    required super.lastUpdated,
    required super.slug,
  });

  factory MyCartModel.fromMap(Map<String, dynamic> data) => MyCartModel(
        url: data['url'] as String,
        myCartItems: (data['My_Cart_Items'] as List<dynamic>)
            .map((e) => MyCartItemModel.fromMap(e as Map<String, dynamic>))
            .toList(),
        isFinished: data['is_finished'] as bool,
        totalMyCartCost: (data['Total_MyCart_Cost'] as num?)?.toDouble(),
        order: data['Order'] == null
            ? null
            : OrderModel.fromMap(data['Order'] as Map<String, dynamic>),
        createdDate: DateTime.parse(data['created_date'] as String),
        lastUpdated: data['last_updated'] == null
            ? null
            : DateTime.parse(data['last_updated'] as String),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MyCartModel].
  factory MyCartModel.fromJson(String data) {
    return MyCartModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
