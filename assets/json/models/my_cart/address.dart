import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'geo.dart';
import 'street.dart';

class Address extends Equatable {
  final String? url;
  final String? name;
  final String? native;
  final Street? street;
  final Geo? geo;
  final String? slug;

  const Address({
    this.url,
    this.name,
    this.native,
    this.street,
    this.geo,
    this.slug,
  });

  factory Address.fromMap(Map<String, dynamic> data) {
    return Address(
      url: data['url'] as String?,
      name: data['name'] as String?,
      native: data['native'] as String?,
      street: data['street'] == null
          ? null
          : Street.fromMap(data['street'] as Map<String, dynamic>),
      geo: data['geo'] == null
          ? null
          : Geo.fromMap(data['geo'] as Map<String, dynamic>),
      slug: data['slug'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'street': street?.toMap(),
        'geo': geo?.toMap(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Address].
  factory Address.fromJson(String data) {
    return Address.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Address] to a JSON string.
  String toJson() => json.encode(toMap());

  Address copyWith({
    String? url,
    String? name,
    String? native,
    Street? street,
    Geo? geo,
    String? slug,
  }) {
    return Address(
      url: url ?? this.url,
      name: name ?? this.name,
      native: native ?? this.native,
      street: street ?? this.street,
      geo: geo ?? this.geo,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, name, native, street, geo, slug];
}
