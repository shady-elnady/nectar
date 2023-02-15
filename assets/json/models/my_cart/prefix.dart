import 'dart:convert';

import 'package:equatable/equatable.dart';

class Prefix extends Equatable {
  final String? url;
  final String? name;
  final String? native;
  final String? symbol;
  final int? power;
  final String? slug;

  const Prefix({
    this.url,
    this.name,
    this.native,
    this.symbol,
    this.power,
    this.slug,
  });

  factory Prefix.fromMap(Map<String, dynamic> data) => Prefix(
        url: data['url'] as String?,
        name: data['name'] as String?,
        native: data['native'] as String?,
        symbol: data['symbol'] as String?,
        power: data['power'] as int?,
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
    int? power,
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

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, name, native, symbol, power, slug];
}
