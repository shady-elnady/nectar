import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/brand_model.dart';

abstract class BrandsLocalDataSource {
  Future<List<BrandModel>> getCachedBrands();
  Future<Unit> cacheBrands(List<BrandModel> brandsList);
}

const cachedBrands = "CACHED_BRANDS";

class BrandsLocalDataSourceImpl implements BrandsLocalDataSource {
  final SharedPreferences sharedPreferences;

  BrandsLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheBrands(List<BrandModel> brandsList) {
    List brandsListToJson =
        brandsList.map<Map<String, dynamic>>((brand) => brand.toMap()).toList();
    sharedPreferences.setString(cachedBrands, json.encode(brandsListToJson));
    return Future.value(unit);
  }

  @override
  Future<List<BrandModel>> getCachedBrands() {
    final jsonString = sharedPreferences.getString(cachedBrands);
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
