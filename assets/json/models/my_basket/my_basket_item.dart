import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'product.dart';

class MyBasketItem extends Equatable {
  final String? url;
  final String? myBasket;
  final Product? product;
  final int? amount;
  final double? totalItemPrice;
  final DateTime? createdDate;
  final DateTime? lastUpdated;
  final String? slug;

  const MyBasketItem({
    this.url,
    this.myBasket,
    this.product,
    this.amount,
    this.totalItemPrice,
    this.createdDate,
    this.lastUpdated,
    this.slug,
  });

  factory MyBasketItem.fromMap(Map<String, dynamic> data) => MyBasketItem(
        url: data['url'] as String?,
        myBasket: data['my_basket'] as String?,
        product: data['product'] == null
            ? null
            : Product.fromMap(data['product'] as Map<String, dynamic>),
        amount: data['amount'] as int?,
        totalItemPrice: (data['total_item_price'] as num?)?.toDouble(),
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
        'my_basket': myBasket,
        'product': product?.toMap(),
        'amount': amount,
        'total_item_price': totalItemPrice,
        'created_date': createdDate?.toIso8601String(),
        'last_updated': lastUpdated?.toIso8601String(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MyBasketItem].
  factory MyBasketItem.fromJson(String data) {
    return MyBasketItem.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MyBasketItem] to a JSON string.
  String toJson() => json.encode(toMap());

  MyBasketItem copyWith({
    String? url,
    String? myBasket,
    Product? product,
    int? amount,
    double? totalItemPrice,
    DateTime? createdDate,
    DateTime? lastUpdated,
    String? slug,
  }) {
    return MyBasketItem(
      url: url ?? this.url,
      myBasket: myBasket ?? this.myBasket,
      product: product ?? this.product,
      amount: amount ?? this.amount,
      totalItemPrice: totalItemPrice ?? this.totalItemPrice,
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
