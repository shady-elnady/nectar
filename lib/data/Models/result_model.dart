import 'dart:convert';

class Result {
  Result({
    this.url,
    this.slug,
  });

  final String? url;
  final String? slug;

  Result copyWith({
    String? url,
    String? name,
    String? slug,
  }) =>
      Result(
        url: url ?? this.url,
        slug: slug ?? this.slug,
      );

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        url: json["url"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "slug": slug,
      };
}
