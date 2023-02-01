import 'dart:convert';

import '../../../../App/Entities/base_entity.dart';
import 'geo.dart';
import 'street.dart';

class Address extends BaseEntity {
  final String? native;
  final Street? street;
  final Geo? geo;

  const Address({
    required super.url,
    required super.name,
    this.native,
    this.street,
    this.geo,
    required super.slug,
  });

  @override
  String toString() {
    return 'Address(url: $url, name: $name, native: $native, street: $street, geo: $geo, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [Address] to a JSON string.
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'street': street?.toMap(),
        'geo': geo?.toMap(),
        'slug': slug,
      };

  Address copyWith({
    required String url,
    required String name,
    String? native,
    Street? street,
    Geo? geo,
    required String slug,
  }) {
    return Address(
      url: this.url,
      name: this.name,
      native: native ?? this.native,
      street: street ?? this.street,
      geo: geo ?? this.geo,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        name,
        native,
        street,
        geo,
        slug,
      ];
}
