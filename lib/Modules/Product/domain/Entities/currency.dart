import 'dart:convert';

import 'package:nectar_mac/App/Entities/base_entity_name.dart';

class Currency extends BaseEntityWithName {
  final String? native;
  final String code;
  final String? emoji;

  const Currency({
    required super.url,
    required super.name,
    this.native,
    required this.code,
    this.emoji,
    required super.slug,
  });

  @override
  String toString() {
    return 'Currency(url: $url, name: $name, native: $native, code: $code, emoji: $emoji, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [Currency] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'code': code,
        'emoji': emoji,
        'slug': slug,
      };

  Currency copyWith({
    required String url,
    required String name,
    String? native,
    required String code,
    String? emoji,
    required String slug,
  }) {
    return Currency(
      url: this.url,
      name: this.name,
      native: native ?? this.native,
      code: this.code,
      emoji: emoji ?? this.emoji,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        name,
        native,
        code,
        emoji,
        slug,
      ];
}
