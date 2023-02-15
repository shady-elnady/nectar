import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'product.dart';

class MyCartItem extends Equatable {
  final String? url;
  final String? myCart;
  final Product? product;
  final double? amount;
  final double? myCartItemPrice;
  final DateTime? createdDate;
  final DateTime? lastUpdated;
  final String? slug;

  const MyCartItem({
    this.url,
    this.myCart,
    this.product,
    this.amount,
    this.myCartItemPrice,
    this.createdDate,
    this.lastUpdated,
    this.slug,
  });

  factory MyCartItem.fromMap(Map<String, dynamic> data) => MyCartItem(
        url: data['url'] as String?,
        myCart: data['my_cart'] as String?,
        product: data['product'] == null
            ? null
            : Product.fromMap(data['product'] as Map<String, dynamic>),
        amount: (data['amount'] as num?)?.toDouble(),
        myCartItemPrice: (data['My_Cart_Item_Price'] as num?)?.toDouble(),
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
        'my_cart': myCart,
        'product': product?.toMap(),
        'amount': amount,
        'My_Cart_Item_Price': myCartItemPrice,
        'created_date': createdDate?.toIso8601String(),
        'last_updated': lastUpdated?.toIso8601String(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MyCartItem].
  factory MyCartItem.fromJson(String data) {
    return MyCartItem.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MyCartItem] to a JSON string.
  String toJson() => json.encode(toMap());

  MyCartItem copyWith({
    String? url,
    String? myCart,
    Product? product,
    double? amount,
    double? myCartItemPrice,
    DateTime? createdDate,
    DateTime? lastUpdated,
    String? slug,
  }) {
    return MyCartItem(
      url: url ?? this.url,
      myCart: myCart ?? this.myCart,
      product: product ?? this.product,
      amount: amount ?? this.amount,
      myCartItemPrice: myCartItemPrice ?? this.myCartItemPrice,
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
      myCart,
      product,
      amount,
      myCartItemPrice,
      createdDate,
      lastUpdated,
      slug,
    ];
  }
}
