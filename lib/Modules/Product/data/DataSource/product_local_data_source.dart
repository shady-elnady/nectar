import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/UseCases/product_usecase/get_searched_product_usecase.dart';
import '../Models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getCachedSearchedProducts({
    required SearchProductsParameters searchProductsParameters,
  });
  //
  Future<List<ProductModel>> getCachedProducts();
  //
  Future<Unit> cacheProducts(List<ProductModel> productsList);
  //
}

const cachedProducts = "CACHED_PRODUCTS";

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheProducts(List<ProductModel> productsList) {
    List productsListToJson = productsList
        .map<Map<String, dynamic>>((product) => product.toMap())
        .toList();
    sharedPreferences.setString(
        cachedProducts, json.encode(productsListToJson));
    return Future.value(unit);
  }

  @override
  Future<List<ProductModel>> getCachedProducts() {
    final jsonString = sharedPreferences.getString(cachedProducts);
    if (jsonString != null) {
      List<Map<String, dynamic>> decodeJsonData = json.decode(jsonString);
      List<ProductModel> jsonToProductsModel = decodeJsonData
          .map<ProductModel>((jsonProduct) => ProductModel.fromMap(jsonProduct))
          .toList();
      return Future.value(jsonToProductsModel);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<List<ProductModel>> getCachedSearchedProducts({
    required SearchProductsParameters searchProductsParameters,
  }) {
    final jsonString = sharedPreferences.getString(cachedProducts);
    if (jsonString != null) {
      List<Map<String, dynamic>> decodeJsonData = json.decode(jsonString);
      List<Map<String, dynamic>> jsonToSearchedProducts = [];
      if (searchProductsParameters.searchMap["contain_name"] != null) {
        jsonToSearchedProducts = decodeJsonData
            .where(
              (jsonProduct) => jsonProduct["name"]
                  .contains(searchProductsParameters.searchMap["contain_name"]),
            )
            .toList();
      }
      if (searchProductsParameters.searchMap["category_name"] != null) {
        jsonToSearchedProducts = decodeJsonData
            .where(
              (jsonProduct) => jsonProduct["category"]["name"].contains(
                  searchProductsParameters.searchMap["category_name"]),
            )
            .toList();
      }

      List<ProductModel> jsonToProductsModel = jsonToSearchedProducts
          .map<ProductModel>(
            (jsonProduct) => ProductModel.fromMap(jsonProduct),
          )
          .toList();
      return Future.value(jsonToProductsModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
