import 'dart:convert';

import '../../../Product/data/Models/product_model.dart';
import '../../domain/Entities/department.dart';

class DepartmentModel extends Department {
  const DepartmentModel({
    required super.url,
    required super.name,
    required super.products,
    super.isFavorite,
    required super.slug,
  });

  factory DepartmentModel.fromMap(Map<String, dynamic> data) => DepartmentModel(
        url: data['url'] as String,
        name: data['name'] as String,
        products: (data['products'] as List<dynamic>)
            .map((e) => ProductModel.fromMap(e as Map<String, dynamic>))
            .toList(),
        isFavorite: data['is_favorite'] as bool?,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DepartmentModel].
  factory DepartmentModel.fromJson(String data) {
    return DepartmentModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
