import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@immutable
class Prefix {
  final String? url;
  final String? name;
  final String? native;
  final String? symbol;
  final double? power;
  final String? slug;

  const Prefix({
    this.url,
    this.name,
    this.native,
    this.symbol,
    this.power,
    this.slug,
  });

  @override
  String toString() {
    return 'Prefix(url: $url, name: $name, native: $native, symbol: $symbol, power: $power, slug: $slug)';
  }

  factory Prefix.fromMap(Map<String, dynamic> data) => Prefix(
        url: data['url'] as String?,
        name: data['name'] as String?,
        native: data['native'] as String?,
        symbol: data['symbol'] as String?,
        power: (data['power'] as num?)?.toDouble(),
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'symbol': symbol,
        'power': power,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Prefix].
  factory Prefix.fromJson(String data) {
    return Prefix.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Prefix] to a JSON string.
  String toJson() => json.encode(toMap());

  Prefix copyWith({
    String? url,
    String? name,
    String? native,
    String? symbol,
    double? power,
    String? slug,
  }) {
    return Prefix(
      url: url ?? this.url,
      name: name ?? this.name,
      native: native ?? this.native,
      symbol: symbol ?? this.symbol,
      power: power ?? this.power,
      slug: slug ?? this.slug,
    );
  }
}
