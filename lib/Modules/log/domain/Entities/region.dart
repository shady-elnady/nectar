import 'dart:convert';

import '../../../../App/Entities/base_entity.dart';
import 'city.dart';

class Region extends BaseEntity {
  final String native;
  final City city;

  const Region({
    required super.url,
    required super.name,
    required this.native,
    required this.city,
    required super.slug,
  });

  @override
  String toString() {
    return 'Region(url: $url, name: $name, native: $native, city: $city, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [Region] to a JSON string.
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'city': city.toMap(),
        'slug': slug,
      };

  Region copyWith({
    required String url,
    required String name,
    required String native,
    required City city,
    required String slug,
  }) {
    return Region(
      url: this.url,
      name: this.name,
      native: this.native,
      city: this.city,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        name,
        native,
        city,
        slug,
      ];
}
