import 'dart:convert';

import 'package:nectar_mac/App/Entities/base_entity_name.dart';

import 'region.dart';

class Street extends BaseEntityWithName {
  final String? native;
  final Region region;

  const Street({
    required super.url,
    required super.name,
    this.native,
    required this.region,
    required super.slug,
  });

  @override
  String toString() {
    return 'Street(url: $url, name: $name, native: $native, region: $region, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [Street] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'region': region.toMap(),
        'slug': slug,
      };

  Street copyWith({
    required String url,
    required String name,
    String? native,
    required Region region,
    required String slug,
  }) {
    return Street(
      url: this.url,
      name: this.name,
      native: native ?? this.native,
      region: this.region,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        name,
        native,
        region,
        slug,
      ];
}
