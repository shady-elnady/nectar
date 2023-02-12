import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../Product/domain/Entities/product.dart';
import 'my_basket.dart';

class MyBasketItem extends Equatable {
  final String? url;
  final MyBasket myBasket;
  final Product product;
  final int amount;
  final double? totalItemPrice;
  final DateTime? createdDate;
  final DateTime? lastUpdated;
  final String? slug;

  const MyBasketItem({
    this.url,
    required this.myBasket,
    required this.product,
    required this.amount,
    this.totalItemPrice,
    this.createdDate,
    this.lastUpdated,
    this.slug,
  });

  Map<String, dynamic> toMap() => {
        'url': url,
        'my_basket': myBasket.toMap(),
        'product': product.toMap(),
        'amount': amount,
        'total_item_price': totalItemPrice,
        'created_date': createdDate?.toIso8601String(),
        'last_updated': lastUpdated?.toIso8601String(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [MyBasketItem] to a JSON string.
  String toJson() => json.encode(toMap());

  MyBasketItem copyWith({
    String? url,
    required MyBasket myBasket,
    required Product product,
    required int amount,
    double? totalItemPrice,
    DateTime? createdDate,
    DateTime? lastUpdated,
    String? slug,
  }) {
    return MyBasketItem(
      url: url ?? this.url,
      myBasket: this.myBasket,
      product: this.product,
      amount: this.amount,
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
