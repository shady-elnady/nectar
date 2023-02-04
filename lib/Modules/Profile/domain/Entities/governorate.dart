import 'dart:convert';

import '../../../../App/Entities/base_entity.dart';
import 'country.dart';

class Governorate extends BaseEntity {
  final String? native;
  final String? telCode;
  final Country? country;

  const Governorate({
    required super.url,
    required super.name,
    this.native,
    this.telCode,
    this.country,
    required super.slug,
  });

  @override
  String toString() {
    return 'Governorate(url: $url, name: $name, native: $native, telCode: $telCode, country: $country, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [Governorate] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'tel_code': telCode,
        'country': country?.toMap(),
        'slug': slug,
      };

  Governorate copyWith({
    required String url,
    required String name,
    String? native,
    String? telCode,
    Country? country,
    required String slug,
  }) {
    return Governorate(
      url: this.url,
      name: this.name,
      native: native ?? this.native,
      telCode: telCode ?? this.telCode,
      country: country ?? this.country,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        name,
        native,
        telCode,
        country,
        slug,
      ];
}
