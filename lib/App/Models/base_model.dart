import 'package:nectar_mac/App/Entities/base_entity.dart';

abstract class BaseModel extends BaseEntity {
  const BaseModel({
    required super.url,
    required super.name,
    required super.slug,
  });

  factory BaseModel.fromMap(Map<String, dynamic> data);

  /// `dart:convert`
  /// Parses the string and returns the resulting Json object as [BaseModel].
  factory BaseModel.fromJson(String data);
}
