import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'base_unit.dart';
import 'prefix.dart';

class Unit extends Equatable {
  final String? url;
  final String? name;
  final String? native;
  final String? symbol;
  final Prefix? prefix;
  final BaseUnit? baseUnit;
  final String? measurement;
  final String? slug;

  const Unit({
    this.url,
    this.name,
    this.native,
    this.symbol,
    this.prefix,
    this.baseUnit,
    this.measurement,
    this.slug,
  });

  factory Unit.fromMap(Map<String, dynamic> data) => Unit(
        url: data['url'] as String?,
        name: data['name'] as String?,
        native: data['native'] as String?,
        symbol: data['symbol'] as String?,
        prefix: data['prefix'] == null
            ? null
            : Prefix.fromMap(data['prefix'] as Map<String, dynamic>),
        baseUnit: data['base_unit'] == null
            ? null
            : BaseUnit.fromMap(data['base_unit'] as Map<String, dynamic>),
        measurement: data['measurement'] as String?,
        slug: data['slug'] as String?,
      );

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

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Unit].
  factory Unit.fromJson(String data) {
    return Unit.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Unit] to a JSON string.
  String toJson() => json.encode(toMap());

  Unit copyWith({
    String? url,
    String? name,
    String? native,
    String? symbol,
    Prefix? prefix,
    BaseUnit? baseUnit,
    String? measurement,
    String? slug,
  }) {
    return Unit(
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
