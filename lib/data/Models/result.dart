import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:collection/collection.dart';

@immutable
class Result {
  final String? url;
  final String name;
  final String? slug;

  const Result({
    this.url,
    required this.name,
    this.slug,
  });

  @override
  String toString() {
    return 'Result(url: $url, name: $name, slug: $slug)';
  }

  factory Result.fromMap(Map<String, dynamic> data) => Result(
        url: data['url'] as String?,
        name: data['name'] as String,
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Result].
  factory Result.fromJson(String data) {
    return Result.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Result] to a JSON string.
  String toJson() => json.encode(toMap());

  Result copyWith({
    String? url,
    required String name,
    String? slug,
  }) {
    return Result(
      url: url ?? this.url,
      name: this.name,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => url.hashCode ^ name.hashCode ^ slug.hashCode;
}
