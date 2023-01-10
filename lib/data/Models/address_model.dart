import 'dart:convert';

import 'geo_model.dart';
import 'street_model.dart';

class Address {
  Address({
    this.url,
    required this.name,
    this.native,
    this.street,
    this.geo,
    this.slug,
  });

  final String? url;
  final String name;
  final String? native;
  final Street? street;
  final Geo? geo;
  final String? slug;

  Address copyWith({
    String? url,
    String? name,
    String? native,
    Street? street,
    Geo? geo,
    String? slug,
  }) =>
      Address(
        url: url ?? this.url,
        name: name ?? this.name,
        native: native ?? this.native,
        street: street ?? this.street,
        geo: geo ?? this.geo,
        slug: slug ?? this.slug,
      );

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        url: json["url"],
        name: json["name"],
        native: json["native"],
        street: json["street"],
        geo: json["geo"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "name": name,
        "native": native,
        "street": street,
        "geo": geo,
        "slug": slug,
      };
}
