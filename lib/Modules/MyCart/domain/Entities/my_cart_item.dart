import 'dart:convert';

import 'package:nectar_mac/App/Entities/sub_base_entity.dart';

import '../../../Product/domain/Entities/product.dart';

class MyCartItem extends SubBaseEntity {
  final String myCart;
  final Product product;
  final double amount;
  final double myCartItemPrice;
  final DateTime createdDate;
  final DateTime? lastUpdated;

  const MyCartItem({
    required super.url,
    required this.myCart,
    required this.product,
    required this.amount,
    required this.myCartItemPrice,
    required this.createdDate,
    this.lastUpdated,
    required super.slug,
  });

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'my_cart': myCart,
        'product': product.toMap(),
        'amount': amount,
        'My_Cart_Item_Price': myCartItemPrice,
        'created_date': createdDate.toIso8601String(),
        'last_updated': lastUpdated?.toIso8601String(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [MyCartItem] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  MyCartItem copyWith({
    required String url,
    required String myCart,
    required Product product,
    required double amount,
    required double myCartItemPrice,
    required DateTime createdDate,
    DateTime? lastUpdated,
    required String slug,
  }) {
    return MyCartItem(
      url: this.url,
      myCart: this.myCart,
      product: this.product,
      amount: this.amount,
      myCartItemPrice: this.myCartItemPrice,
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
