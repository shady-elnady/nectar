import 'dart:convert';

import 'package:nectar_mac/App/Entities/base_entity_name.dart';

import 'prefix.dart';

class Unit extends BaseEntityWithName {
  final String? native;
  final String symbol;
  final Prefix? prefix;
  final Unit? baseUnit;
  final String? measurement;

  const Unit({
    required super.url,
    required super.name,
    this.native,
    required this.symbol,
    this.prefix,
    this.baseUnit,
    this.measurement,
    required super.slug,
  });

  @override
  String toString() {
    return 'Unit(url: $url, name: $name, native: $native, symbol: $symbol, prefix: $prefix, baseUnit: $baseUnit, measurement: $measurement, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [UnitModel] to a JSON string.
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'symbol': symbol,
        'prefix': prefix?.toMap(),
        'base_unit': baseUnit?.toMap(),
        'measurement': measurement,
        'slug': slug,
      };

  Unit copyWith({
    required String url,
    required String name,
    String? native,
    required String symbol,
    Prefix? prefix,
    Unit? baseUnit,
    String? measurement,
    required String slug,
  }) {
    return Unit(
      url: this.url,
      name: this.name,
      native: native ?? this.native,
      symbol: this.symbol,
      prefix: prefix ?? this.prefix,
      baseUnit: baseUnit ?? this.baseUnit,
      measurement: measurement ?? this.measurement,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        name,
        native,
        symbol,
        prefix,
        baseUnit,
        measurement,
        slug,
      ];
}
