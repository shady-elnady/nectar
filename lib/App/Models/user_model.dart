import 'dart:convert';

import '../Entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.url,
    super.username,
    required super.email,
    super.isActive,
    super.isVerified,
    super.isStaff,
    super.isSuperuser,
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
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserModel].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
