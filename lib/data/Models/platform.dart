// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:collection/collection.dart';

@immutable
class Platform {
  final String? url;
  final String? name;
  final String? native;
  final String? slug;

  const Platform({this.url, this.name, this.native, this.slug});

  @override
  String toString() {
    return 'Platform(url: $url, name: $name, native: $native, slug: $slug)';
  }

  factory Platform.fromMap(Map<String, dynamic> data) => Platform(
        url: data['url'] as String?,
        name: data['name'] as String?,
        native: data['native'] as String?,
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Platform].
  factory Platform.fromJson(String data) {
    return Platform.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Platform] to a JSON string.
  String toJson() => json.encode(toMap());

  Platform copyWith({
    String? url,
    String? name,
    String? native,
    String? slug,
  }) {
    return Platform(
      url: url ?? this.url,
      name: name ?? this.name,
      native: native ?? this.native,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Platform) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      url.hashCode ^ name.hashCode ^ native.hashCode ^ slug.hashCode;
}
