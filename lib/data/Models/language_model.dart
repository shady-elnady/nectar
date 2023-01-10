// To parse this JSON data, do
//
//     final language = languageFromMap(jsonString);

import 'dart:convert';

class Language {
  Language({
    this.url,
    required this.name,
    this.native,
    required this.iso6391,
    required this.isRtl,
    this.slug,
  });

  final String? url;
  final String name;
  final String? native;
  final String iso6391;
  final bool isRtl;
  final String? slug;

  Language copyWith({
    String? url,
    String? name,
    String? native,
    String? iso6391,
    bool? isRtl,
    String? slug,
  }) =>
      Language(
        url: url ?? this.url,
        name: name ?? this.name,
        native: native ?? this.native,
        iso6391: iso6391 ?? this.iso6391,
        isRtl: isRtl ?? this.isRtl,
        slug: slug ?? this.slug,
      );

  factory Language.fromJson(String str) => Language.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Language.fromMap(Map<String, dynamic> json) => Language(
        url: json["url"],
        name: json["name"],
        native: json["native"],
        iso6391: json["iso_639_1"],
        isRtl: json["is_rtl"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "name": name,
        "native": native,
        "iso_639_1": iso6391,
        "is_rtl": isRtl,
        "slug": slug,
      };
}
