import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Utils/cached_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/brand_model.dart';

abstract class BaseBrandLocalDataSource {
  Future<List<BrandModel>> getCachedBrands();
  Future<Unit> cacheBrands(List<BrandModel> brandsList);
}

class BrandsLocalDataSourceImpl implements BaseBrandLocalDataSource {
  final SharedPreferences sharedPreferences;

  BrandsLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheBrands(List<BrandModel> brandsList) {
    List brandsListToJson =
        brandsList.map<Map<String, dynamic>>((brand) => brand.toMap()).toList();
    sharedPreferences.setString(
      CachedPreference.brands,
      json.encode(
        brandsListToJson,
      ),
    );
    return Future.value(unit);
  }

  @override
  Future<List<BrandModel>> getCachedBrands() {
    final jsonString = sharedPreferences.getString(
      CachedPreference.brands,
    );
    if (jsonString != null) {
      List<Map<String, dynamic>> decodeJsonData = json.decode(jsonString);
      List<BrandModel> jsonToBrandsModel = decodeJsonData
          .map<BrandModel>((jsonBrand) => BrandModel.fromMap(jsonBrand))
          .toList();
      return Future.value(jsonToBrandsModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
