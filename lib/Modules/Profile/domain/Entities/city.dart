import 'dart:convert';

import '../../../../App/Entities/base_entity.dart';
import 'governorate.dart';

class City extends BaseEntity {
  final String? native;
  final String? country;
  final Governorate? governorate;

  const City({
    required super.url,
    required super.name,
    this.native,
    this.country,
    this.governorate,
    required super.slug,
  });

  @override
  String toString() {
    return 'City(url: $url, name: $name, native: $native, country: $country, governorate: $governorate, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [City] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'country': country,
        'governorate': governorate?.toMap(),
        'slug': slug,
      };

  City copyWith({
    required String url,
    required String name,
    String? native,
    String? country,
    Governorate? governorate,
    required String slug,
  }) {
    return City(
      url: this.url,
      name: this.name,
      native: native ?? this.native,
      country: country ?? this.country,
      governorate: governorate ?? this.governorate,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        name,
        native,
        country,
        governorate,
        slug,
      ];
}
