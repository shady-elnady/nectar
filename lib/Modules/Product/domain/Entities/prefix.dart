import 'dart:convert';

import 'package:nectar_mac/App/Entities/base_entity_name.dart';

class Prefix extends BaseEntityWithName {
  final String native;
  final String symbol;
  final double power;

  const Prefix({
    required super.url,
    required super.name,
    required this.native,
    required this.symbol,
    required this.power,
    required super.slug,
  });

  @override
  String toString() {
    return 'Prefix(url: $url, name: $name, native: $native, symbol: $symbol, power: $power, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [PrefixModel] to a JSON string.
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'symbol': symbol,
        'power': power,
        'slug': slug,
      };

  Prefix copyWith({
    required String url,
    required String name,
    required String native,
    required String symbol,
    required double power,
    required String slug,
  }) {
    return Prefix(
      url: this.url,
      name: this.name,
      native: this.native,
      symbol: this.symbol,
      power: this.power,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        name,
        native,
        symbol,
        power,
        slug,
      ];
}
