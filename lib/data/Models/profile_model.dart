// To parse this JSON data, do
//
//     final profile = profileFromMap(jsonString);

import 'dart:convert';

import 'address_model.dart';
import 'age_model.dart';
import 'language_model.dart';
import 'user_model.dart';

class Profile {
  Profile({
    this.url,
    this.image,
    required this.user,
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

  final String? url;
  final String? image;
  final User user;
  final String? phoneNumber;
  final String? fullName;
  final String? familyName;
  final DateTime? birthDate;
  final String? gender;
  final Language? language;
  final Address? address;
  final Age? age;
  final String? slug;

  Profile copyWith({
    String? url,
    String? image,
    User? user,
    String? phoneNumber,
    String? fullName,
    String? familyName,
    DateTime? birthDate,
    String? gender,
    Language? language,
    Address? address,
    Age? age,
    String? slug,
  }) =>
      Profile(
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

  factory Profile.fromJson(String str) => Profile.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        url: json["url"],
        image: json["image"],
        user: json["user"],
        phoneNumber: json["phone_number"],
        fullName: json["full_name"],
        familyName: json["family_name"],
        birthDate: json["birth_date"],
        gender: json["gender"],
        language: json["language"],
        address: json["address"],
        age: json["age"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "image": image,
        "user": user,
        "phone_number": phoneNumber,
        "full_name": fullName,
        "family_name": familyName,
        "birth_date": birthDate,
        "gender": gender,
        "language": language,
        "address": address,
        "age": age,
        "slug": slug,
      };
}
