import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/favorite_product_model.dart';

abstract class FavoriteProductLocalDataSource {
  Future<Unit> cacheFavoriteProducts({
    required List<FavoriteProductModel> favoriteProductsList,
  });
  Future<List<FavoriteProductModel>> getCachedFavoriteProducts();
}

const cachedFavoriteProducts = "CACHED_FAVORITE_PRODUCTS";

class FavoriteProductLocalDataSourceImpl
    implements FavoriteProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  FavoriteProductLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheFavoriteProducts({
    required List<FavoriteProductModel> favoriteProductsList,
  }) {
    List favoriteProductsListToJson = favoriteProductsList
        .map<Map<String, dynamic>>((item) => item.toMap())
        .toList();
    sharedPreferences.setString(
        cachedFavoriteProducts, json.encode(favoriteProductsListToJson));
    return Future.value(unit);
  }

  @override
  Future<List<FavoriteProductModel>> getCachedFavoriteProducts() {
    final jsonString = sharedPreferences.getString(cachedFavoriteProducts);
    if (jsonString != null) {
      List<Map<String, dynamic>> decodeJsonData = json.decode(jsonString);
      List<FavoriteProductModel> jsonToFavoriteProductsModel = decodeJsonData
          .map<FavoriteProductModel>((favoriteProductMap) =>
              FavoriteProductModel.fromMap(favoriteProductMap))
          .toList();
      return Future.value(jsonToFavoriteProductsModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
