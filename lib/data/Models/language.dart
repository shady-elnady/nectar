// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:collection/collection.dart';

import 'applicatins_support.dart';

@immutable
class Language {
  final String? url;
  final String? name;
  final String? native;
  final String? iso6391;
  final String? emoji;
  final bool? isRtl;
  final List<Application>? applicatinsSupport;
  final String? slug;

  const Language({
    this.url,
    this.name,
    this.native,
    this.iso6391,
    this.emoji,
    this.isRtl,
    this.applicatinsSupport,
    this.slug,
  });

  @override
  String toString() {
    return 'Language(url: $url, name: $name, native: $native, iso6391: $iso6391, emoji: $emoji, isRtl: $isRtl, applicatinsSupport: $applicatinsSupport, slug: $slug)';
  }

  factory Language.fromMap(Map<String, dynamic> data) => Language(
        url: data['url'] as String?,
        name: data['name'] as String?,
        native: data['native'] as String?,
        iso6391: data['iso_639_1'] as String?,
        emoji: data['emoji'] as String?,
        isRtl: data['is_rtl'] as bool?,
        applicatinsSupport: (data['applicatins_support'] as List<dynamic>?)
            ?.map((e) => Application.fromMap(e as Map<String, dynamic>))
            .toList(),
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'iso_639_1': iso6391,
        'emoji': emoji,
        'is_rtl': isRtl,
        'applicatins_support':
            applicatinsSupport?.map((e) => e.toMap()).toList(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Language].
  factory Language.fromJson(String data) {
    return Language.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Language] to a JSON string.
  String toJson() => json.encode(toMap());

  Language copyWith({
    String? url,
    String? name,
    String? native,
    String? iso6391,
    String? emoji,
    bool? isRtl,
    List<Application>? applicatinsSupport,
    String? slug,
  }) {
    return Language(
      url: url ?? this.url,
      name: name ?? this.name,
      native: native ?? this.native,
      iso6391: iso6391 ?? this.iso6391,
      emoji: emoji ?? this.emoji,
      isRtl: isRtl ?? this.isRtl,
      applicatinsSupport: applicatinsSupport ?? this.applicatinsSupport,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Language) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      url.hashCode ^
      name.hashCode ^
      native.hashCode ^
      iso6391.hashCode ^
      emoji.hashCode ^
      isRtl.hashCode ^
      applicatinsSupport.hashCode ^
      slug.hashCode;
}
