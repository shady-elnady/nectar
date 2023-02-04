import 'dart:convert';

import 'package:nectar_mac/App/Entities/original_entity.dart';

import '../../../Department/domain/Entities/product.dart';
import '../../../log/domain/Entities/language.dart';
import 'address.dart';
import 'age.dart';

class MyProfile extends OriginalEntity {
  final String? image;
  final String? phoneNumber;
  final String? fullName;
  final String? familyName;
  final String? birthDate;
  final String gender;
  final Language? language;
  final Address? address;
  final Age? age;
  final List<Product?> favoritesProducts;

  const MyProfile({
    required super.url,
    this.image,
    this.phoneNumber,
    this.fullName,
    this.familyName,
    this.birthDate,
    required this.gender,
    this.language,
    this.address,
    this.age,
    required this.favoritesProducts,
    required super.slug,
  });

  @override
  String toString() {
    return 'MyProfile(url: $url, image: $image, phoneNumber: $phoneNumber, fullName: $fullName, familyName: $familyName, birthDate: $birthDate, gender: $gender, language: $language, address: $address, age: $age, favoritesProducts: $favoritesProducts, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [MyProfile] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'image': image,
        'phone_number': phoneNumber,
        'full_name': fullName,
        'family_name': familyName,
        'birth_date': birthDate,
        'gender': gender,
        'language': language?.toMap(),
        'address': address?.toMap(),
        'age': age?.toMap(),
        'favorites_products': favoritesProducts.map((e) => e!.toMap()).toList(),
        'slug': slug,
      };

  MyProfile copyWith({
    required String url,
    String? image,
    String? phoneNumber,
    String? fullName,
    String? familyName,
    String? birthDate,
    required String gender,
    Language? language,
    Address? address,
    Age? age,
    required List<Product?> favoritesProducts,
    required String slug,
  }) {
    return MyProfile(
      url: this.url,
      image: image ?? this.image,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fullName: fullName ?? this.fullName,
      familyName: familyName ?? this.familyName,
      birthDate: birthDate ?? this.birthDate,
      gender: this.gender,
      language: language ?? this.language,
      address: address ?? this.address,
      age: age ?? this.age,
      favoritesProducts: this.favoritesProducts,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        image,
        phoneNumber,
        fullName,
        familyName,
        birthDate,
        gender,
        language,
        address,
        age,
        favoritesProducts,
        slug,
      ];
}
