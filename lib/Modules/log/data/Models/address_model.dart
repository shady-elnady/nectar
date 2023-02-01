import 'dart:convert';

import '../../domain/Entities/address.dart';
import 'geo_model.dart';
import 'street_model.dart';

class AddressModel extends Address {
  const AddressModel({
    required super.url,
    required super.name,
    super.native,
    super.street,
    super.geo,
    required super.slug,
  });

  factory AddressModel.fromMap(Map<String, dynamic> data) => AddressModel(
        url: data['url'] as String,
        name: data['name'] as String,
        native: data['native'] as String?,
        street: data['street'] == null
            ? null
            : StreetModel.fromMap(data['street'] as Map<String, dynamic>),
        geo: data['geo'] == null
            ? null
            : GeoModel.fromMap(data['geo'] as Map<String, dynamic>),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  /// Parses the string and returns the resulting Json object as [AddressModel].
  factory AddressModel.fromJson(String data) {
    return AddressModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
