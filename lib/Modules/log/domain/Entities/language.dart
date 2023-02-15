import 'dart:convert';

import 'package:nectar_mac/App/Entities/base_entity_name.dart';

import 'applicatins.dart';

class Language extends BaseEntityWithName {
  final String native;
  final String iso6391;
  final String? emoji;
  final bool isRtl;
  final List<Application>? applicatinsSupport;

  const Language({
    required super.url,
    required super.name,
    required this.native,
    required this.iso6391,
    this.emoji,
    required this.isRtl,
    this.applicatinsSupport,
    required super.slug,
  });

  @override
  String toString() {
    return 'Language(url: $url, name: $name, native: $native, iso6391: $iso6391, emoji: $emoji, isRtl: $isRtl, applicatinsSupport: $applicatinsSupport, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [Language] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  @override
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

  Language copyWith({
    required String url,
    required String name,
    required String native,
    required String iso6391,
    String? emoji,
    required bool isRtl,
    List<Application>? applicatinsSupport,
    required String slug,
  }) {
    return Language(
      url: this.url,
      name: this.name,
      native: this.native,
      iso6391: this.iso6391,
      emoji: emoji ?? this.emoji,
      isRtl: this.isRtl,
      applicatinsSupport: applicatinsSupport ?? this.applicatinsSupport,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        name,
        native,
        iso6391,
        emoji,
        isRtl,
        applicatinsSupport,
        slug,
      ];
}
