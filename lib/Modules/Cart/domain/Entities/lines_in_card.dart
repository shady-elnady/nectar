import 'dart:convert';

import 'package:nectar_mac/App/Entities/original_entity.dart';

import '../../../Department/domain/Entities/product.dart';

class LinesInCard extends OriginalEntity {
  final String card;
  final Product product;
  final int amount;
  final double totalLinePrice;

  const LinesInCard({
    required super.url,
    required this.card,
    required this.product,
    required this.amount,
    required this.totalLinePrice,
    required super.slug,
  });

  @override
  String toString() {
    return 'LinesInCard(url: $url, card: $card, product: $product, amount: $amount, totalLinePrice: $totalLinePrice, slug: $slug)';
  }

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'card': card,
        'product': product.toMap(),
        'amount': amount,
        'total_line_price': totalLinePrice,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [LinesInCard] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  LinesInCard copyWith({
    required String url,
    required String card,
    required Product product,
    required int amount,
    required double totalLinePrice,
    required String slug,
  }) {
    return LinesInCard(
      url: this.url,
      card: this.card,
      product: this.product,
      amount: this.amount,
      totalLinePrice: this.totalLinePrice,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [];
}
