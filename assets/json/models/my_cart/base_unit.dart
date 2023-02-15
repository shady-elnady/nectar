import 'dart:convert';

import 'package:equatable/equatable.dart';

class BaseUnit extends Equatable {
  final String? url;
  final String? name;
  final String? native;
  final String? symbol;
  final dynamic prefix;
  final dynamic baseUnit;
  final String? measurement;
  final String? slug;

  const BaseUnit({
    this.url,
    this.name,
    this.native,
    this.symbol,
    this.prefix,
    this.baseUnit,
    this.measurement,
    this.slug,
  });

  factory BaseUnit.fromMap(Map<String, dynamic> data) => BaseUnit(
        url: data['url'] as String?,
        name: data['name'] as String?,
        native: data['native'] as String?,
        symbol: data['symbol'] as String?,
        prefix: data['prefix'] as dynamic,
        baseUnit: data['base_unit'] as dynamic,
        measurement: data['measurement'] as String?,
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'symbol': symbol,
        'prefix': prefix,
        'base_unit': baseUnit,
        'measurement': measurement,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BaseUnit].
  factory BaseUnit.fromJson(String data) {
    return BaseUnit.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BaseUnit] to a JSON string.
  String toJson() => json.encode(toMap());

  BaseUnit copyWith({
    String? url,
    String? name,
    String? native,
    String? symbol,
    dynamic prefix,
    dynamic baseUnit,
    String? measurement,
    String? slug,
  }) {
    return BaseUnit(
      url: url ?? this.url,
      name: name ?? this.name,
      native: native ?? this.native,
      symbol: symbol ?? this.symbol,
      prefix: prefix ?? this.prefix,
      baseUnit: baseUnit ?? this.baseUnit,
      measurement: measurement ?? this.measurement,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
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
}
