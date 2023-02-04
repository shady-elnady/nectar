import 'dart:convert';

import '../../domain/Entities/age.dart';

class AgeModel extends Age {
  const AgeModel({
    required super.year,
    required super.month,
    required super.day,
  });

  factory AgeModel.fromMap(Map<String, dynamic> data) => AgeModel(
        year: data['year'] as int,
        month: data['month'] as int,
        day: data['day'] as int,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AgeModel].
  factory AgeModel.fromJson(String data) {
    return AgeModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
