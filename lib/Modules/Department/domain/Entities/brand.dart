import 'dart:convert';

import 'package:nectar_mac/App/Entities/base_entity.dart';

class Brand extends BaseEntity {
  final String? image;

  const Brand({
    required super.url,
    required super.name,
    this.image,
    required super.slug,
  });

  @override
  String toString() =>
      'Brand(url: $url, name: $name, image: $image, slug: $slug)';

  /// `dart:convert`
  ///
  /// Converts [Brand] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'image': image,
        'slug': slug,
      };

  Brand copyWith({
    required String url,
    required String name,
    String? image,
    required String slug,
  }) {
    return Brand(
      url: this.url,
      name: this.name,
      image: image ?? this.image,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        name,
        image,
        slug,
      ];
}
