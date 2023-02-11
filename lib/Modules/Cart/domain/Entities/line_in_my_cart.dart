import 'dart:convert';

import 'package:nectar_mac/App/Entities/original_entity.dart';

import '../../../Product/domain/Entities/product.dart';
import 'my_cart.dart';

class LineInMyCart extends OriginalEntity {
  final MyCart myCart;
  final Product product;
  final int amount;
  final double totalLinePrice;

  const LineInMyCart({
    required super.url,
    required this.myCart,
    required this.product,
    required this.amount,
    required this.totalLinePrice,
    required super.slug,
  });

  @override
  String toString() {
    return 'LineInMyCart(url: $url, myCart: $myCart, product: $product, amount: $amount, totalLinePrice: $totalLinePrice, slug: $slug)';
  }

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'my_cart': myCart.toMap(),
        'product': product.toMap(),
        'amount': amount,
        'total_line_price': totalLinePrice,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [LineInMyCart] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  LineInMyCart copyWith({
    required String url,
    required String myCart,
    required Product product,
    required int amount,
    required double totalLinePrice,
    required String slug,
  }) {
    return LineInMyCart(
      url: this.url,
      myCart: this.myCart,
      product: this.product,
      amount: this.amount,
      totalLinePrice: this.totalLinePrice,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        myCart,
        product,
        amount,
        totalLinePrice,
        slug,
      ];
}
