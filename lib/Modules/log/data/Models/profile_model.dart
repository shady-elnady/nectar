import 'dart:convert';

import '../../domain/Entities/profile.dart';
import 'address_model.dart';
import 'age_model.dart';
import 'language_model.dart';
import 'user_model.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.url,
    super.image,
    required super.user,
    super.phoneNumber,
    super.fullName,
    super.familyName,
    super.birthDate,
    required super.gender,
    super.language,
    super.address,
    super.age,
    required super.slug,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> data) => ProfileModel(
        url: data['url'] as String,
        image: data['image'] as String?,
        user: UserModel.fromMap(data['user'] as Map<String, dynamic>),
        phoneNumber: data['phone_number'] as String?,
        fullName: data['full_name'] as String?,
        familyName: data['family_name'] as String?,
        birthDate: data['birth_date'] as String?,
        gender: data['gender'] as String,
        language: data['language'] == null
            ? null
            : LanguageModel.fromMap(data['language'] as Map<String, dynamic>),
        address: data['address'] == null
            ? null
            : AddressModel.fromMap(data['address'] as Map<String, dynamic>),
        age: data['age'] == null
            ? null
            : AgeModel.fromMap(data['age'] as Map<String, dynamic>),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProfileModel].
  factory ProfileModel.fromJson(String data) {
    return ProfileModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
