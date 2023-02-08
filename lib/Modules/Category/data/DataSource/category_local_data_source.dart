import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/Entities/category.dart';
import '../Models/Category_model.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryModel>> getCachedCategories();
  Future<Unit> cacheCategories(List<CategoryModel> categoriessList);
}

const cachedCategories = "CACHED_CATEGORIES";

class CategoriesLocalDataSourceImpl implements CategoryLocalDataSource {
  final SharedPreferences sharedPreferences;

  CategoriesLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheCategories(List<Category> categoriessList) {
    List categoriesListListToJson = categoriessList
        .map<Map<String, dynamic>>((category) => category.toMap())
        .toList();
    sharedPreferences.setString(
        cachedCategories, json.encode(categoriesListListToJson));
    return Future.value(unit);
  }

  @override
  Future<List<CategoryModel>> getCachedCategories() {
    final jsonString = sharedPreferences.getString(cachedCategories);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<CategoryModel> jsonToCategorysModel = decodeJsonData
          .map<CategoryModel>(
              (jsonCategory) => CategoryModel.fromJson(jsonCategory))
          .toList();
      return Future.value(jsonToCategorysModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
