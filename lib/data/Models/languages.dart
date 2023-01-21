// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:collection/collection.dart';

@immutable
class Languages {
  final String? url;
  final String? name;
  final String? native;
  final String? iso6391;
  final bool? isRtl;
  final String? slug;

  const Languages({
    this.url,
    this.name,
    this.native,
    this.iso6391,
    this.isRtl,
    this.slug,
  });

  @override
  String toString() {
    return 'Languages(url: $url, name: $name, native: $native, iso6391: $iso6391, isRtl: $isRtl, slug: $slug)';
  }

  factory Languages.fromMap(Map<String, dynamic> data) => Languages(
        url: data['url'] as String?,
        name: data['name'] as String?,
        native: data['native'] as String?,
        iso6391: data['iso_639_1'] as String?,
        isRtl: data['is_rtl'] as bool?,
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'iso_639_1': iso6391,
        'is_rtl': isRtl,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Languages].
  factory Languages.fromJson(String data) {
    return Languages.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Languages] to a JSON string.
  String toJson() => json.encode(toMap());

  Languages copyWith({
    String? url,
    String? name,
    String? native,
    String? iso6391,
    bool? isRtl,
    String? slug,
  }) {
    return Languages(
      url: url ?? this.url,
      name: name ?? this.name,
      native: native ?? this.native,
      iso6391: iso6391 ?? this.iso6391,
      isRtl: isRtl ?? this.isRtl,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Languages) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      url.hashCode ^
      name.hashCode ^
      native.hashCode ^
      iso6391.hashCode ^
      isRtl.hashCode ^
      slug.hashCode;
}
