import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Utils/cached_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/Entities/category.dart';
import '../Models/category_model.dart';

abstract class BaseCategoryLocalDataSource {
  Future<List<CategoryModel>> getCachedCategories();
  Future<Unit> cacheCategories({
    required List<CategoryModel> categoriesList,
  });
}

class CategoriesLocalDataSourceImpl implements BaseCategoryLocalDataSource {
  final SharedPreferences sharedPreferences;

  CategoriesLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheCategories({
    required List<Category> categoriesList,
  }) {
    List categoriesListListToJson = categoriesList
        .map<Map<String, dynamic>>((category) => category.toMap())
        .toList();
    sharedPreferences.setString(
        CachedPreference.categories, json.encode(categoriesListListToJson));
    return Future.value(unit);
  }

  @override
  Future<List<CategoryModel>> getCachedCategories() {
    final jsonString = sharedPreferences.getString(CachedPreference.categories);
    if (jsonString != null) {
      List<Map<String, dynamic>> decodeJsonData = json.decode(jsonString);
      List<CategoryModel> jsonToCategorysModel = decodeJsonData
          .map<CategoryModel>(
              (jsonCategory) => CategoryModel.fromMap(jsonCategory))
          .toList();
      return Future.value(jsonToCategorysModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
