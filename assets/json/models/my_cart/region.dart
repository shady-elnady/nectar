import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'city.dart';

class Region extends Equatable {
  final String? url;
  final String? name;
  final String? native;
  final City? city;
  final String? slug;

  const Region({this.url, this.name, this.native, this.city, this.slug});

  factory Region.fromMap(Map<String, dynamic> data) => Region(
        url: data['url'] as String?,
        name: data['name'] as String?,
        native: data['native'] as String?,
        city: data['city'] == null
            ? null
            : City.fromMap(data['city'] as Map<String, dynamic>),
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'city': city?.toMap(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Region].
  factory Region.fromJson(String data) {
    return Region.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Region] to a JSON string.
  String toJson() => json.encode(toMap());

  Region copyWith({
    String? url,
    String? name,
    String? native,
    City? city,
    String? slug,
  }) {
    return Region(
      url: url ?? this.url,
      name: name ?? this.name,
      native: native ?? this.native,
      city: city ?? this.city,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, name, native, city, slug];
}
