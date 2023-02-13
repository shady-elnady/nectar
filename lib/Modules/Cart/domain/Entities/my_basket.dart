// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:collection/collection.dart';

import 'package:equatable/equatable.dart';

import 'my_basket_item.dart';

class MyBasket extends Equatable {
  final String? url;
  final List<MyBasketItem?> myBasketItems;
  final DateTime? createdDate;
  final DateTime? lastUpdated;
  final String? slug;

  const MyBasket.initialize({
    this.url,
    this.myBasketItems = const [],
    this.createdDate,
    this.lastUpdated,
    this.slug,
  });

  double? get totalMyBasketCost => myBasketItems
      .map(
        (MyBasketItem? item) => item!.amount * item.product.price,
      )
      .sum;

  static MyBasket? _instance;

  factory MyBasket({
    String? url,
    required List<MyBasketItem?> myBasketItems,
    double? totalMyBasketCost,
    DateTime? createdDate,
    DateTime? lastUpdated,
    String? slug,
  }) =>
      _instance = _instance ??
          MyBasket.initialize(
            url: url,
            myBasketItems: myBasketItems,
            createdDate: createdDate,
            lastUpdated: lastUpdated,
            slug: slug,
          );

  Map<String, dynamic> toMap() => {
        'url': url,
        'My_Basket_Items': myBasketItems.map((e) => e!.toMap()).toList(),
        'created_date': createdDate?.toIso8601String(),
        'last_updated': lastUpdated?.toIso8601String(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [MyBasket] to a JSON string.
  String toJson() => json.encode(toMap());

  MyBasket copyWith({
    String? url,
    required List<MyBasketItem?> myBasketItems,
    double? totalMyBasketCost,
    DateTime? createdDate,
    DateTime? lastUpdated,
    String? slug,
  }) {
    return MyBasket.initialize(
      url: url ?? this.url,
      myBasketItems: this.myBasketItems,
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
      myBasketItems,
      createdDate,
      lastUpdated,
      slug,
    ];
  }
}
