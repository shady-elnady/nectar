import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'applications_support.dart';

class Language extends Equatable {
  final String? url;
  final String? name;
  final String? native;
  final String? iso6391;
  final String? emoji;
  final bool? isRtl;
  final List<ApplicationsSupport>? applicationsSupport;
  final String? slug;

  const Language({
    this.url,
    this.name,
    this.native,
    this.iso6391,
    this.emoji,
    this.isRtl,
    this.applicationsSupport,
    this.slug,
  });

  factory Language.fromMap(Map<String, dynamic> data) => Language(
        url: data['url'] as String?,
        name: data['name'] as String?,
        native: data['native'] as String?,
        iso6391: data['iso_639_1'] as String?,
        emoji: data['emoji'] as String?,
        isRtl: data['is_rtl'] as bool?,
        applicationsSupport: (data['applications_support'] as List<dynamic>?)
            ?.map((e) => ApplicationsSupport.fromMap(e as Map<String, dynamic>))
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
        'applications_support':
            applicationsSupport?.map((e) => e.toMap()).toList(),
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
    List<ApplicationsSupport>? applicationsSupport,
    String? slug,
  }) {
    return Language(
      url: url ?? this.url,
      name: name ?? this.name,
      native: native ?? this.native,
      iso6391: iso6391 ?? this.iso6391,
      emoji: emoji ?? this.emoji,
      isRtl: isRtl ?? this.isRtl,
      applicationsSupport: applicationsSupport ?? this.applicationsSupport,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      url,
      name,
      native,
      iso6391,
      emoji,
      isRtl,
      applicationsSupport,
      slug,
    ];
  }
}
