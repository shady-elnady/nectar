import 'dart:convert';

import 'governorate_model.dart';

class City {
  City({
    this.url,
    required this.name,
    this.native,
    required this.country,
    required this.governorate,
    this.slug,
  });

  final String? url;
  final String name;
  final String? native;
  final String country;
  final Governorate governorate;
  final String? slug;

  City copyWith({
    String? url,
    String? name,
    String? native,
    String? country,
    Governorate? governorate,
    String? slug,
  }) =>
      City(
        url: url ?? this.url,
        name: name ?? this.name,
        native: native ?? this.native,
        country: country ?? this.country,
        governorate: governorate ?? this.governorate,
        slug: slug ?? this.slug,
      );

  factory City.fromJson(String str) => City.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory City.fromMap(Map<String, dynamic> json) => City(
        url: json["url"],
        name: json["name"],
        native: json["native"],
        country: json["country"],
        governorate: json["governorate"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "name": name,
        "native": native,
        "country": country,
        "governorate": governorate,
        "slug": slug,
      };
}
