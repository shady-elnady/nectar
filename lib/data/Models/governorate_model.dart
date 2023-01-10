// To parse this JSON data, do
//
//     final profile = profileFromMap(jsonString);

import 'dart:convert';

import 'country_model.dart';

class Governorate {
  Governorate({
    this.url,
    required this.name,
    this.native,
    required this.telCode,
    required this.country,
    this.slug,
  });

  final String? url;
  final String name;
  final String? native;
  final String telCode;
  final Country country;
  final String? slug;

  Governorate copyWith({
    String? url,
    String? name,
    String? native,
    String? telCode,
    Country? country,
    String? slug,
  }) =>
      Governorate(
        url: url ?? this.url,
        name: name ?? this.name,
        native: native ?? this.native,
        telCode: telCode ?? this.telCode,
        country: country ?? this.country,
        slug: slug ?? this.slug,
      );

  factory Governorate.fromJson(String str) =>
      Governorate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Governorate.fromMap(Map<String, dynamic> json) => Governorate(
        url: json["url"],
        name: json["name"],
        native: json["native"],
        telCode: json["tel_code"],
        country: json["country"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "name": name,
        "native": native,
        "tel_code": telCode,
        "country": country,
        "slug": slug,
      };
}
