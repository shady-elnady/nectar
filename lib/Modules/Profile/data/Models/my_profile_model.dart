import 'dart:convert';

import '../../../MyCart/data/Models/my_cart_model.dart';
import '../../../Product/data/Models/product_model.dart';
import '../../../log/data/Models/language_model.dart';
import '../../domain/Entities/my_profile.dart';
import 'address_model.dart';
import 'age_model.dart';

class MyProfileModel extends MyProfile {
  const MyProfileModel({
    required super.url,
    super.image,
    super.phoneNumber,
    super.fullName,
    super.familyName,
    super.birthDate,
    super.gender,
    super.language,
    super.address,
    super.age,
    super.myBasket,
    super.favoritesProducts,
    required super.slug,
  });

  factory MyProfileModel.fromMap(Map<String, dynamic> data) => MyProfileModel(
        url: data['url'] as String,
        image: data['image'] as String?,
        phoneNumber: data['phone_number'] as String?,
        fullName: data['full_name'] as String?,
        familyName: data['family_name'] as String?,
        birthDate: data['birth_date'] as String?,
        gender: data['gender'] as String?,
        language: data['language'] == null
            ? null
            : LanguageModel.fromMap(data['language'] as Map<String, dynamic>),
        address: data['address'] == null
            ? null
            : AddressModel.fromMap(data['address'] as Map<String, dynamic>),
        age: data['age'] == null
            ? null
            : AgeModel.fromMap(data['age'] as Map<String, dynamic>),
        myBasket: data['my_basket'] == null
            ? null
            : MyCartModel.fromMap(data['my_basket'] as Map<String, dynamic>),
        favoritesProducts: (data['favorites_products'] as List<dynamic>?)
            ?.map((e) => ProductModel.fromMap(e as Map<String, dynamic>))
            .toList(),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MyProfileModel].
  factory MyProfileModel.fromJson(String data) {
    return MyProfileModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
