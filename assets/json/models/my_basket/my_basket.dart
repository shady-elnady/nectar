import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'my_basket_item.dart';

class MyBasket extends Equatable {
  final String? url;
  final List<MyBasketItem>? myBasketItems;
  final double? totalMyBasketCost;
  final DateTime? createdDate;
  final DateTime? lastUpdated;
  final String? slug;

  const MyBasket({
    this.url,
    this.myBasketItems,
    this.totalMyBasketCost,
    this.createdDate,
    this.lastUpdated,
    this.slug,
  });

  factory MyBasket.fromMap(Map<String, dynamic> data) => MyBasket(
        url: data['url'] as String?,
        myBasketItems: (data['My_Basket_Items'] as List<dynamic>?)
            ?.map((e) => MyBasketItem.fromMap(e as Map<String, dynamic>))
            .toList(),
        totalMyBasketCost: (data['Total_My_Basket_Cost'] as num?)?.toDouble(),
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
        'My_Basket_Items': myBasketItems?.map((e) => e.toMap()).toList(),
        'Total_My_Basket_Cost': totalMyBasketCost,
        'created_date': createdDate?.toIso8601String(),
        'last_updated': lastUpdated?.toIso8601String(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MyBasket].
  factory MyBasket.fromJson(String data) {
    return MyBasket.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MyBasket] to a JSON string.
  String toJson() => json.encode(toMap());

  MyBasket copyWith({
    String? url,
    List<MyBasketItem>? myBasketItems,
    double? totalMyBasketCost,
    DateTime? createdDate,
    DateTime? lastUpdated,
    String? slug,
  }) {
    return MyBasket(
      url: url ?? this.url,
      myBasketItems: myBasketItems ?? this.myBasketItems,
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
