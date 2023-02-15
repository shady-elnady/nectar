import 'dart:convert';

import 'package:nectar_mac/App/Entities/sub_base_entity.dart';

class Geo extends SubBaseEntity {
  final double lat;
  final double lang;

  const Geo({
    required super.url,
    required this.lat,
    required this.lang,
    required super.slug,
  });

  @override
  String toString() => 'Geo(url: $url, lat: $lat, lang: $lang, slug: $slug)';

  /// `dart:convert`
  ///
  /// Converts [Geo] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'lat': lat,
        'lang': lang,
        'slug': slug,
      };

  Geo copyWith({
    required int url,
    required double lat,
    required double lang,
    required int slug,
  }) {
    return Geo(
      url: this.url,
      lat: this.lat,
      lang: this.lang,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        lat,
        lang,
        slug,
      ];
}
