import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Brand_model.dart';

abstract class BrandLocalDataSource {
  Future<List<BrandModel>> getCachedBrands();
  Future<Unit> cacheBrands(List<BrandModel> brandsList);
}

const cachedBrand = "CACHED_BRANDS";

class BrandLocalDataSourceImpl implements BrandLocalDataSource {
  final SharedPreferences sharedPreferences;

  BrandLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheBrands(List<BrandModel> brandsList) {
    List brandsListToJson =
        brandsList.map<Map<String, dynamic>>((brand) => brand.toMap()).toList();
    sharedPreferences.setString(cachedBrand, json.encode(brandsListToJson));
    return Future.value(unit);
  }

  @override
  Future<List<BrandModel>> getCachedBrands() {
    final jsonString = sharedPreferences.getString(cachedBrand);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<BrandModel> jsonToBrandsModel = decodeJsonData
          .map<BrandModel>((jsonBrand) => BrandModel.fromJson(jsonBrand))
          .toList();
      return Future.value(jsonToBrandsModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
