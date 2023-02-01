import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'address.dart';
import 'age.dart';
import 'language.dart';
import 'user.dart';

class Profile extends Equatable {
  final String url;
  final String? image;
  final User user;
  final String? phoneNumber;
  final String? fullName;
  final String? familyName;
  final String? birthDate;
  final String gender;
  final Language? language;
  final Address? address;
  final Age? age;
  final String slug;

  const Profile({
    required this.url,
    this.image,
    required this.user,
    this.phoneNumber,
    this.fullName,
    this.familyName,
    this.birthDate,
    required this.gender,
    this.language,
    this.address,
    this.age,
    required this.slug,
  });

  @override
  String toString() {
    return 'Profile(url: $url, image: $image, user: $user, phoneNumber: $phoneNumber, fullName: $fullName, familyName: $familyName, birthDate: $birthDate, gender: $gender, language: $language, address: $address, age: $age, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [Profile] to a JSON string.
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'url': url,
        'image': image,
        'user': user.toMap(),
        'phone_number': phoneNumber,
        'full_name': fullName,
        'family_name': familyName,
        'birth_date': birthDate,
        'gender': gender,
        'language': language?.toMap(),
        'address': address?.toMap(),
        'age': age?.toMap(),
        'slug': slug,
      };

  Profile copyWith({
    required String url,
    String? image,
    required User user,
    String? phoneNumber,
    String? fullName,
    String? familyName,
    String? birthDate,
    required String gender,
    Language? language,
    Address? address,
    Age? age,
    required String slug,
  }) {
    return Profile(
      url: this.url,
      image: image ?? this.image,
      user: this.user,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fullName: fullName ?? this.fullName,
      familyName: familyName ?? this.familyName,
      birthDate: birthDate ?? this.birthDate,
      gender: this.gender,
      language: language ?? this.language,
      address: address ?? this.address,
      age: age ?? this.age,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        image,
        user,
        phoneNumber,
        fullName,
        familyName,
        birthDate,
        gender,
        language,
        address,
        age,
        slug,
      ];
}
