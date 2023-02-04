import 'dart:convert';

import '../../domain/Entities/unit.dart';
import 'prefix_model.dart';

class UnitModel extends Unit {
  const UnitModel({
    required super.url,
    required super.name,
    super.native,
    required super.symbol,
    super.prefix,
    super.baseUnit,
    super.measurement,
    required super.slug,
  });

  factory UnitModel.fromMap(Map<String, dynamic> data) => UnitModel(
        url: data['url'] as String,
        name: data['name'] as String,
        native: data['native'] as String?,
        symbol: data['symbol'] as String,
        prefix: data['prefix'] == null
            ? null
            : PrefixModel.fromMap(data['prefix'] as Map<String, dynamic>),
        baseUnit: data['base_unit'] == null
            ? null
            : UnitModel.fromMap(data['base_unit'] as Map<String, dynamic>),
        measurement: data['measurement'] as String?,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UnitModel].
  factory UnitModel.fromJson(String data) {
    return UnitModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
