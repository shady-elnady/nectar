import 'dart:convert';

import 'package:equatable/equatable.dart';

class Geo extends Equatable {
  final int lat;
  final int lang;

  const Geo({
    required this.lat,
    required this.lang,
  });

  @override
  String toString() => 'Geo(lat: $lat, lang: $lang)';

  /// `dart:convert`
  ///
  /// Converts [Geo] to a JSON string.
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'lat': lat,
        'lang': lang,
      };

  Geo copyWith({
    required int lat,
    required int lang,
  }) {
    return Geo(
      lat: this.lat,
      lang: this.lang,
    );
  }

  @override
  List<Object?> get props => [
        lat,
        lang,
      ];
}
