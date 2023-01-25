// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:collection/collection.dart';

import 'platform.dart';

@immutable
class Application {
  final String? url;
  final String? name;
  final String? native;
  final Platform? platform;
  final String? slug;

  const Application({
    this.url,
    this.name,
    this.native,
    this.platform,
    this.slug,
  });

  @override
  String toString() {
    return 'Application(url: $url, name: $name, native: $native, platform: $platform, slug: $slug)';
  }

  factory Application.fromMap(Map<String, dynamic> data) {
    return Application(
      url: data['url'] as String?,
      name: data['name'] as String?,
      native: data['native'] as String?,
      platform: data['platform'] == null
          ? null
          : Platform.fromMap(data['platform'] as Map<String, dynamic>),
      slug: data['slug'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'platform': platform?.toMap(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ApplicatinsSupport].
  factory Application.fromJson(String data) {
    return Application.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Application] to a JSON string.
  String toJson() => json.encode(toMap());

  Application copyWith({
    String? url,
    String? name,
    String? native,
    Platform? platform,
    String? slug,
  }) {
    return Application(
      url: url ?? this.url,
      name: name ?? this.name,
      native: native ?? this.native,
      platform: platform ?? this.platform,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Application) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      url.hashCode ^
      name.hashCode ^
      native.hashCode ^
      platform.hashCode ^
      slug.hashCode;
}
