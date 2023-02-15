import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'platform.dart';

class ApplicationsSupport extends Equatable {
  final String? url;
  final String? name;
  final String? native;
  final Platform? platform;
  final String? slug;

  const ApplicationsSupport({
    this.url,
    this.name,
    this.native,
    this.platform,
    this.slug,
  });

  factory ApplicationsSupport.fromMap(Map<String, dynamic> data) {
    return ApplicationsSupport(
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
  /// Parses the string and returns the resulting Json object as [ApplicationsSupport].
  factory ApplicationsSupport.fromJson(String data) {
    return ApplicationsSupport.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ApplicationsSupport] to a JSON string.
  String toJson() => json.encode(toMap());

  ApplicationsSupport copyWith({
    String? url,
    String? name,
    String? native,
    Platform? platform,
    String? slug,
  }) {
    return ApplicationsSupport(
      url: url ?? this.url,
      name: name ?? this.name,
      native: native ?? this.native,
      platform: platform ?? this.platform,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, name, native, platform, slug];
}
