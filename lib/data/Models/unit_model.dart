import 'dart:convert';

class Unit {
  Unit({
    this.url,
    required this.name,
    this.native,
    required this.symbol,
    this.prefix,
    this.baseUnit,
    this.measurement,
    this.slug,
  });

  final String? url;
  final String name;
  final String? native;
  final String symbol;
  final Prefix? prefix;
  final Unit? baseUnit;
  final String? measurement;
  final String? slug;

  Unit copyWith({
    String? url,
    String? name,
    String? native,
    String? symbol,
    Prefix? prefix,
    Unit? baseUnit,
    String? measurement,
    String? slug,
  }) =>
      Unit(
        url: url ?? this.url,
        name: name ?? this.name,
        native: native ?? this.native,
        symbol: symbol ?? this.symbol,
        prefix: prefix ?? this.prefix,
        baseUnit: baseUnit ?? this.baseUnit,
        measurement: measurement ?? this.measurement,
        slug: slug ?? this.slug,
      );

  factory Unit.fromJson(String str) => Unit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Unit.fromMap(Map<String, dynamic> json) => Unit(
        url: json["url"],
        name: json["name"],
        native: json["native"],
        symbol: json["symbol"],
        prefix: json["prefix"],
        baseUnit: json["base_unit"],
        measurement: json["measurement"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "name": name,
        "native": native,
        "symbol": symbol,
        "prefix": prefix,
        "base_unit": baseUnit,
        "measurement": measurement,
        "slug": slug,
      };
}

class Prefix {
  Prefix({
    this.url,
    required this.name,
    this.native,
    required this.symbol,
    required this.power,
    this.slug,
  });

  final String? url;
  final String name;
  final String? native;
  final String symbol;
  final int power;
  final String? slug;

  Prefix copyWith({
    String? url,
    String? name,
    String? native,
    String? symbol,
    int? power,
    String? slug,
  }) =>
      Prefix(
        url: url ?? this.url,
        name: name ?? this.name,
        native: native ?? this.native,
        symbol: symbol ?? this.symbol,
        power: power ?? this.power,
        slug: slug ?? this.slug,
      );

  factory Prefix.fromJson(String str) => Prefix.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Prefix.fromMap(Map<String, dynamic> json) => Prefix(
        url: json["url"],
        name: json["name"],
        native: json["native"],
        symbol: json["symbol"],
        power: json["power"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "name": name,
        "native": native,
        "symbol": symbol,
        "power": power,
        "slug": slug,
      };
}
