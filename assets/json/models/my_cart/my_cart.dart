import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'my_cart_item.dart';
import 'order.dart';

class MyCart extends Equatable {
  final String? url;
  final List<MyCartItem>? myCartItems;
  final bool? isFinished;
  final double? totalMyCartCost;
  final Order? order;
  final DateTime? createdDate;
  final DateTime? lastUpdated;
  final String? slug;

  const MyCart({
    this.url,
    this.myCartItems,
    this.isFinished,
    this.totalMyCartCost,
    this.order,
    this.createdDate,
    this.lastUpdated,
    this.slug,
  });

  factory MyCart.fromMap(Map<String, dynamic> data) => MyCart(
        url: data['url'] as String?,
        myCartItems: (data['My_Cart_Items'] as List<dynamic>?)
            ?.map((e) => MyCartItem.fromMap(e as Map<String, dynamic>))
            .toList(),
        isFinished: data['is_finished'] as bool?,
        totalMyCartCost: (data['Total_MyCart_Cost'] as num?)?.toDouble(),
        order: data['Order'] == null
            ? null
            : Order.fromMap(data['Order'] as Map<String, dynamic>),
        createdDate: data['created_date'] == null
            ? null
            : DateTime.parse(data['created_date'] as String),
        lastUpdated: data['last_updated'] == null
            ? null
            : DateTime.parse(data['last_updated'] as String),
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'My_Cart_Items': myCartItems?.map((e) => e.toMap()).toList(),
        'is_finished': isFinished,
        'Total_MyCart_Cost': totalMyCartCost,
        'Order': order?.toMap(),
        'created_date': createdDate?.toIso8601String(),
        'last_updated': lastUpdated?.toIso8601String(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MyCart].
  factory MyCart.fromJson(String data) {
    return MyCart.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MyCart] to a JSON string.
  String toJson() => json.encode(toMap());

  MyCart copyWith({
    String? url,
    List<MyCartItem>? myCartItems,
    bool? isFinished,
    double? totalMyCartCost,
    Order? order,
    DateTime? createdDate,
    DateTime? lastUpdated,
    String? slug,
  }) {
    return MyCart(
      url: url ?? this.url,
      myCartItems: myCartItems ?? this.myCartItems,
      isFinished: isFinished ?? this.isFinished,
      totalMyCartCost: totalMyCartCost ?? this.totalMyCartCost,
      order: order ?? this.order,
      createdDate: createdDate ?? this.createdDate,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      slug: slug ?? this.slug,
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
