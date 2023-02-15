import 'dart:convert';

import 'package:nectar_mac/App/Entities/sub_base_entity.dart';

import 'my_cart_item.dart';
import 'order.dart';

class MyCart extends SubBaseEntity {
  final List<MyCartItem?> myCartItems;
  final bool isFinished;
  final double? totalMyCartCost;
  final Order? order;
  final DateTime createdDate;
  final DateTime? lastUpdated;

  const MyCart({
    required super.url,
    required this.myCartItems,
    required this.isFinished,
    this.totalMyCartCost,
    this.order,
    required this.createdDate,
    this.lastUpdated,
    required super.slug,
  });

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'My_Cart_Items': myCartItems.map((e) => e?.toMap()).toList(),
        'is_finished': isFinished,
        'Total_MyCart_Cost': totalMyCartCost,
        'Order': order?.toMap(),
        'created_date': createdDate.toIso8601String(),
        'last_updated': lastUpdated?.toIso8601String(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [MyCart] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  MyCart copyWith({
    required String url,
    required List<MyCartItem?> myCartItems,
    required bool isFinished,
    double? totalMyCartCost,
    Order? order,
    required DateTime createdDate,
    DateTime? lastUpdated,
    required String slug,
  }) {
    return MyCart(
      url: this.url,
      myCartItems: this.myCartItems,
      isFinished: this.isFinished,
      totalMyCartCost: totalMyCartCost ?? this.totalMyCartCost,
      order: order ?? this.order,
      createdDate: this.createdDate,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      slug: this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      url,
      myCartItems,
      isFinished,
      totalMyCartCost,
      order,
      createdDate,
      lastUpdated,
      slug,
    ];
  }
}
