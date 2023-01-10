// To parse this JSON data, do
//
//     final region = regionFromMap(jsonString);

import 'dart:convert';

import 'city_model.dart';

class Region {
  Region({
    this.url,
    required this.name,
    this.native,
    required this.city,
    this.slug,
  });

  final String? url;
  final String name;
  final String? native;
  final City city;
  final String? slug;

  Region copyWith({
    String? url,
    String? name,
    String? native,
    City? city,
    String? slug,
  }) =>
      Region(
        url: url ?? this.url,
        name: name ?? this.name,
        native: native ?? this.native,
        city: city ?? this.city,
        slug: slug ?? this.slug,
      );

  factory Region.fromJson(String str) => Region.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Region.fromMap(Map<String, dynamic> json) => Region(
        url: json["url"],
        name: json["name"],
        native: json["native"],
        city: json["city"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "name": name,
        "native": native,
        "city": city,
        "slug": slug,
      };
}
