import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'governorate.dart';

class City extends Equatable {
  final String? url;
  final String? name;
  final String? native;
  final String? country;
  final Governorate? governorate;
  final String? slug;

  const City({
    this.url,
    this.name,
    this.native,
    this.country,
    this.governorate,
    this.slug,
  });

  factory City.fromMap(Map<String, dynamic> data) => City(
        url: data['url'] as String?,
        name: data['name'] as String?,
        native: data['native'] as String?,
        country: data['country'] as String?,
        governorate: data['governorate'] == null
            ? null
            : Governorate.fromMap(data['governorate'] as Map<String, dynamic>),
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'country': country,
        'governorate': governorate?.toMap(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [City].
  factory City.fromJson(String data) {
    return City.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [City] to a JSON string.
  String toJson() => json.encode(toMap());

  City copyWith({
    String? url,
    String? name,
    String? native,
    String? country,
    Governorate? governorate,
    String? slug,
  }) {
    return City(
      url: url ?? this.url,
      name: name ?? this.name,
      native: native ?? this.native,
      country: country ?? this.country,
      governorate: governorate ?? this.governorate,
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
      country,
      governorate,
      slug,
    ];
  }
}
