import 'dart:convert';

import '../../../Product/data/Models/product_model.dart';
import '../../domain/Entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.url,
    super.username,
    required super.email,
    super.isActive,
    super.isVerified,
    super.isStaff,
    super.isSuperuser,
    required super.favoritesProducts,
    required super.slug,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        url: data['url'] as String,
        username: data['username'] as String?,
        email: data['email'] as String,
        isActive: data['is_active'] as bool?,
        isVerified: data['is_verified'] as bool?,
        isStaff: data['is_staff'] as bool?,
        isSuperuser: data['is_superuser'] as bool?,
        favoritesProducts: (data['favorites_products'] as List<dynamic>)
            .map((e) => ProductModel.fromMap(e as Map<String, dynamic>))
            .toList(),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserModel].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
