import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getCachedProducts();
  Future<Unit> cacheProducts(List<ProductModel> productsList);
}

const cachedProduct = "CACHED_ProductS";

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheProducts(List<ProductModel> productsList) {
    List productsListToJson = productsList
        .map<Map<String, dynamic>>((product) => product.toMap())
        .toList();
    sharedPreferences.setString(cachedProduct, json.encode(productsListToJson));
    return Future.value(unit);
  }

  @override
  Future<List<ProductModel>> getCachedProducts() {
    final jsonString = sharedPreferences.getString(cachedProduct);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<ProductModel> jsonToProductsModel = decodeJsonData
          .map<ProductModel>(
              (jsonProduct) => ProductModel.fromJson(jsonProduct))
          .toList();
      return Future.value(jsonToProductsModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
