import 'dart:convert';

import 'package:nectar_mac/App/Entities/sub_base_entity.dart';

import '../../../MyCart/domain/Entities/my_cart.dart';
import '../../../Product/domain/Entities/product.dart';
import '../../../log/domain/Entities/language.dart';
import 'address.dart';
import 'age.dart';

class MyProfile extends SubBaseEntity {
  final String? image;
  final String? phoneNumber;
  final String? fullName;
  final String? familyName;
  final String? birthDate;
  final String? gender;
  final Language? language;
  final Address? address;
  final Age? age;
  final MyCart? myBasket;
  final List<Product>? favoritesProducts;

  const MyProfile({
    required super.url,
    this.image,
    this.phoneNumber,
    this.fullName,
    this.familyName,
    this.birthDate,
    this.gender,
    this.language,
    this.address,
    this.age,
    this.myBasket,
    this.favoritesProducts,
    required super.slug,
  });

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
        'my_basket': myBasket?.toMap(),
        'favorites_products': favoritesProducts?.map((e) => e.toMap()).toList(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [MyProfile] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  MyProfile copyWith({
    String? url,
    String? image,
    String? phoneNumber,
    String? fullName,
    String? familyName,
    String? birthDate,
    String? gender,
    Language? language,
    Address? address,
    Age? age,
    MyCart? myBasket,
    List<Product>? favoritesProducts,
    String? slug,
  }) {
    return MyProfile(
      url: url ?? this.url,
      image: image ?? this.image,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fullName: fullName ?? this.fullName,
      familyName: familyName ?? this.familyName,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      language: language ?? this.language,
      address: address ?? this.address,
      age: age ?? this.age,
      myBasket: myBasket ?? this.myBasket,
      favoritesProducts: favoritesProducts ?? this.favoritesProducts,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
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
      myBasket,
      favoritesProducts,
      slug,
    ];
  }
}
