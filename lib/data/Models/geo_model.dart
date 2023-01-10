import 'dart:convert';

class Geo {
  Geo({
    required this.lat,
    required this.lang,
  });

  final int lat;
  final int lang;

  Geo copyWith({
    int? lat,
    int? lang,
  }) =>
      Geo(
        lat: lat ?? this.lat,
        lang: lang ?? this.lang,
      );

  factory Geo.fromJson(String str) => Geo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Geo.fromMap(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lang: json["lang"],
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lang": lang,
      };
}
