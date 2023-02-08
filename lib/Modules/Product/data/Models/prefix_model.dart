import 'dart:convert';

import '../../domain/Entities/prefix.dart';

class PrefixModel extends Prefix {
  const PrefixModel({
    required super.url,
    required super.name,
    required super.native,
    required super.symbol,
    required super.power,
    required super.slug,
  });

  @override
  String toString() {
    return 'Prefix(url: $url, name: $name, native: $native, symbol: $symbol, power: $power, slug: $slug)';
  }

  factory PrefixModel.fromMap(Map<String, dynamic> data) => PrefixModel(
        url: data['url'] as String,
        name: data['name'] as String,
        native: data['native'] as String,
        symbol: data['symbol'] as String,
        power: (data['power'] as num).toDouble(),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PrefixModel].
  factory PrefixModel.fromJson(String data) {
    return PrefixModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
