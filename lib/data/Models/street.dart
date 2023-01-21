// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:collection/collection.dart';

import 'region.dart';

@immutable
class Street {
  final String? url;
  final String? name;
  final String? native;
  final Region? region;
  final String? slug;

  const Street({this.url, this.name, this.native, this.region, this.slug});

  @override
  String toString() {
    return 'Street(url: $url, name: $name, native: $native, region: $region, slug: $slug)';
  }

  factory Street.fromMap(Map<String, dynamic> data) => Street(
        url: data['url'] as String?,
        name: data['name'] as String?,
        native: data['native'] as String?,
        region: data['region'] == null
            ? null
            : Region.fromMap(data['region'] as Map<String, dynamic>),
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'region': region?.toMap(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Street].
  factory Street.fromJson(String data) {
    return Street.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Street] to a JSON string.
  String toJson() => json.encode(toMap());

  Street copyWith({
    String? url,
    String? name,
    String? native,
    Region? region,
    String? slug,
  }) {
    return Street(
      url: url ?? this.url,
      name: name ?? this.name,
      native: native ?? this.native,
      region: region ?? this.region,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Street) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      url.hashCode ^
      name.hashCode ^
      native.hashCode ^
      region.hashCode ^
      slug.hashCode;
}
