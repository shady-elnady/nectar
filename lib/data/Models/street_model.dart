import 'dart:convert';

import 'city_model.dart';

class Street {
  Street({
    this.url,
    required this.name,
    this.native,
    required this.region,
    this.slug,
    required this.city,
  });

  final String? url;
  final String name;
  final String? native;
  final Street region;
  final String? slug;
  final City city;

  Street copyWith({
    String? url,
    String? name,
    String? native,
    Street? region,
    String? slug,
    City? city,
  }) =>
      Street(
        url: url ?? this.url,
        name: name ?? this.name,
        native: native ?? this.native,
        region: region ?? this.region,
        slug: slug ?? this.slug,
        city: city ?? this.city,
      );

  factory Street.fromJson(String str) => Street.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Street.fromMap(Map<String, dynamic> json) => Street(
        url: json["url"],
        name: json["name"],
        native: json["native"],
        region: json["region"],
        slug: json["slug"],
        city: json["city"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "name": name,
        "native": native,
        "region": region,
        "slug": slug,
        "city": city,
      };
}
