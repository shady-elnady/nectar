import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'my_basket_item.dart';

class MyBasket extends Equatable {
  final String? url;
  final List<MyBasketItem?> myBasketItems;
  final double? totalMyBasketCost;
  final DateTime? createdDate;
  final DateTime? lastUpdated;
  final String? slug;

  // const MyBasket({
  //   this.url,
  //   required this.myBasketItems,
  //   this.totalMyBasketCost,
  //   this.createdDate,
  //   this.lastUpdated,
  //   this.slug,
  // });
/////////////////
  ///
  const MyBasket._({
    this.url,
    required this.myBasketItems,
    this.totalMyBasketCost,
    this.createdDate,
    this.lastUpdated,
    this.slug,
  });

  static MyBasket? _instance;

  static void initialize({
    String? url,
    required List<MyBasketItem?> myBasketItems,
    double? totalMyBasketCost,
    DateTime? createdDate,
    DateTime? lastUpdated,
    String? slug,
  }) {
    _instance = MyBasket._(
      url: url,
      myBasketItems: myBasketItems,
      totalMyBasketCost: totalMyBasketCost,
      createdDate: createdDate,
      lastUpdated: lastUpdated,
      slug: slug,
    );
  }

  static MyBasket get instance =>
      _instance!; // throw an "initialize first" error

/////////////////

  Map<String, dynamic> toMap() => {
        'url': url,
        'My_Basket_Items': myBasketItems.map((e) => e!.toMap()).toList(),
        'Total_My_Basket_Cost': totalMyBasketCost,
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
    return MyBasket._(
      url: url ?? this.url,
      myBasketItems: this.myBasketItems,
      totalMyBasketCost: totalMyBasketCost ?? this.totalMyBasketCost,
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
      totalMyBasketCost,
      createdDate,
      lastUpdated,
      slug,
    ];
  }
}
