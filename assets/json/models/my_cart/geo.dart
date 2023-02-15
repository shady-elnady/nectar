import 'dart:convert';

import 'package:equatable/equatable.dart';

class Geo extends Equatable {
  final String? url;
  final double? lat;
  final double? lang;
  final String? slug;

  const Geo({this.url, this.lat, this.lang, this.slug});

  factory Geo.fromMap(Map<String, dynamic> data) => Geo(
        url: data['url'] as String?,
        lat: (data['lat'] as num?)?.toDouble(),
        lang: (data['lang'] as num?)?.toDouble(),
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'lat': lat,
        'lang': lang,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Geo].
  factory Geo.fromJson(String data) {
    return Geo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Geo] to a JSON string.
  String toJson() => json.encode(toMap());

  Geo copyWith({
    String? url,
    double? lat,
    double? lang,
    String? slug,
  }) {
    return Geo(
      url: url ?? this.url,
      lat: lat ?? this.lat,
      lang: lang ?? this.lang,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, lat, lang, slug];
}
