// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:collection/collection.dart';

@immutable
class Geo {
  final int? lat;
  final int? lang;

  const Geo({this.lat, this.lang});

  @override
  String toString() => 'Geo(lat: $lat, lang: $lang)';

  factory Geo.fromMap(Map<String, dynamic> data) => Geo(
        lat: data['lat'] as int?,
        lang: data['lang'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'lat': lat,
        'lang': lang,
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
    int? lat,
    int? lang,
  }) {
    return Geo(
      lat: lat ?? this.lat,
      lang: lang ?? this.lang,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Geo) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => lat.hashCode ^ lang.hashCode;
}
