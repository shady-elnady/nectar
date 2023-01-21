// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:collection/collection.dart';

import 'country.dart';

@immutable
class Governorate {
  final String? url;
  final String? name;
  final String? native;
  final String? telCode;
  final Country? country;
  final String? slug;

  const Governorate({
    this.url,
    this.name,
    this.native,
    this.telCode,
    this.country,
    this.slug,
  });

  @override
  String toString() {
    return 'Governorate(url: $url, name: $name, native: $native, telCode: $telCode, country: $country, slug: $slug)';
  }

  factory Governorate.fromMap(Map<String, dynamic> data) => Governorate(
        url: data['url'] as String?,
        name: data['name'] as String?,
        native: data['native'] as String?,
        telCode: data['tel_code'] as String?,
        country: data['country'] == null
            ? null
            : Country.fromMap(data['country'] as Map<String, dynamic>),
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'tel_code': telCode,
        'country': country?.toMap(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Governorate].
  factory Governorate.fromJson(String data) {
    return Governorate.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Governorate] to a JSON string.
  String toJson() => json.encode(toMap());

  Governorate copyWith({
    String? url,
    String? name,
    String? native,
    String? telCode,
    Country? country,
    String? slug,
  }) {
    return Governorate(
      url: url ?? this.url,
      name: name ?? this.name,
      native: native ?? this.native,
      telCode: telCode ?? this.telCode,
      country: country ?? this.country,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Governorate) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      url.hashCode ^
      name.hashCode ^
      native.hashCode ^
      telCode.hashCode ^
      country.hashCode ^
      slug.hashCode;
}
