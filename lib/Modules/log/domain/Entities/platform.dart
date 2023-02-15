import 'dart:convert';

import 'package:nectar_mac/App/Entities/base_entity_name.dart';

class Platform extends BaseEntityWithName {
  final String? native;

  const Platform({
    required super.url,
    required super.name,
    this.native,
    required super.slug,
  });

  @override
  String toString() {
    return 'Platform(url: $url, name: $name, native: $native, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [Platform] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'slug': slug,
      };

  Platform copyWith({
    required String url,
    required String name,
    String? native,
    required String slug,
  }) {
    return Platform(
      url: this.url,
      name: this.name,
      native: native ?? this.native,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        name,
        native,
        slug,
      ];
}
