// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:collection/collection.dart';

import 'address.dart';
import 'age.dart';
import 'language.dart';
import 'user.dart';

@immutable
class Profile {
  final String? url;
  final String? image;
  final User? user;
  final String? phoneNumber;
  final String? fullName;
  final String? familyName;
  final String? birthDate;
  final String? gender;
  final Language? language;
  final Address? address;
  final Age? age;
  final String? slug;

  const Profile({
    this.url,
    this.image,
    this.user,
    this.phoneNumber,
    this.fullName,
    this.familyName,
    this.birthDate,
    this.gender,
    this.language,
    this.address,
    this.age,
    this.slug,
  });

  @override
  String toString() {
    return 'Profile(url: $url, image: $image, user: $user, phoneNumber: $phoneNumber, fullName: $fullName, familyName: $familyName, birthDate: $birthDate, gender: $gender, language: $language, address: $address, age: $age, slug: $slug)';
  }

  factory Profile.fromMap(Map<String, dynamic> data) => Profile(
        url: data['url'] as String?,
        image: data['image'] as String?,
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
        phoneNumber: data['phone_number'] as String?,
        fullName: data['full_name'] as String?,
        familyName: data['family_name'] as String?,
        birthDate: data['birth_date'] as String?,
        gender: data['gender'] as String?,
        language: data['language'] == null
            ? null
            : Language.fromMap(data['language'] as Map<String, dynamic>),
        address: data['address'] == null
            ? null
            : Address.fromMap(data['address'] as Map<String, dynamic>),
        age: data['age'] == null
            ? null
            : Age.fromMap(data['age'] as Map<String, dynamic>),
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'image': image,
        'user': user?.toMap(),
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

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Profile].
  factory Profile.fromJson(String data) {
    return Profile.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Profile] to a JSON string.
  String toJson() => json.encode(toMap());

  Profile copyWith({
    String? url,
    String? image,
    User? user,
    String? phoneNumber,
    String? fullName,
    String? familyName,
    String? birthDate,
    String? gender,
    Language? language,
    Address? address,
    Age? age,
    String? slug,
  }) {
    return Profile(
      url: url ?? this.url,
      image: image ?? this.image,
      user: user ?? this.user,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fullName: fullName ?? this.fullName,
      familyName: familyName ?? this.familyName,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      language: language ?? this.language,
      address: address ?? this.address,
      age: age ?? this.age,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Profile) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      url.hashCode ^
      image.hashCode ^
      user.hashCode ^
      phoneNumber.hashCode ^
      fullName.hashCode ^
      familyName.hashCode ^
      birthDate.hashCode ^
      gender.hashCode ^
      language.hashCode ^
      address.hashCode ^
      age.hashCode ^
      slug.hashCode;
}
