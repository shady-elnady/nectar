import 'dart:convert';

import 'package:equatable/equatable.dart';

class Brand extends Equatable {
  final String? url;
  final String? name;
  final String? image;
  final String? slug;

  const Brand({this.url, this.name, this.image, this.slug});

  factory Brand.fromMap(Map<String, dynamic> data) => Brand(
        url: data['url'] as String?,
        name: data['name'] as String?,
        image: data['image'] as String?,
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'image': image,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Brand].
  factory Brand.fromJson(String data) {
    return Brand.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Brand] to a JSON string.
  String toJson() => json.encode(toMap());

  Brand copyWith({
    String? url,
    String? name,
    String? image,
    String? slug,
  }) {
    return Brand(
      url: url ?? this.url,
      name: name ?? this.name,
      image: image ?? this.image,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, name, image, slug];
}
