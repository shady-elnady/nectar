import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@immutable
class Currency {
  final String? url;
  final String? name;
  final String? native;
  final String? code;
  final String? emoji;
  final String? slug;

  const Currency({
    this.url,
    this.name,
    this.native,
    this.code,
    this.emoji,
    this.slug,
  });

  @override
  String toString() {
    return 'Currency(url: $url, name: $name, native: $native, code: $code, emoji: $emoji, slug: $slug)';
  }

  factory Currency.fromMap(Map<String, dynamic> data) => Currency(
        url: data['url'] as String?,
        name: data['name'] as String?,
        native: data['native'] as String?,
        code: data['code'] as String?,
        emoji: data['emoji'] as String?,
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'code': code,
        'emoji': emoji,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Currency].
  factory Currency.fromJson(String data) {
    return Currency.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Currency] to a JSON string.
  String toJson() => json.encode(toMap());

  Currency copyWith({
    String? url,
    String? name,
    String? native,
    String? code,
    String? emoji,
    String? slug,
  }) {
    return Currency(
      url: url ?? this.url,
      name: name ?? this.name,
      native: native ?? this.native,
      code: code ?? this.code,
      emoji: emoji ?? this.emoji,
      slug: slug ?? this.slug,
    );
  }
}
