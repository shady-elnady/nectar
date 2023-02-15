import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/my_cart_item_model.dart';

abstract class MyCartItemLocalDataSource {
  Future<Unit> cacheMyCartItems({
    required List<MyCartItemModel> myCartItemsList,
  });
  Future<List<MyCartItemModel>> getCachedMyCartItems();
}

const cachedMyCartItems = "CACHED_MY_CART_ITEMS";

class MyCartItemLocalDataSourceImpl implements MyCartItemLocalDataSource {
  final SharedPreferences sharedPreferences;

  MyCartItemLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheMyCartItems({
    required List<MyCartItemModel> myCartItemsList,
  }) {
    List myCartItemsListToJson = myCartItemsList
        .map<Map<String, dynamic>>((item) => item.toMap())
        .toList();
    sharedPreferences.setString(
        cachedMyCartItems, json.encode(myCartItemsListToJson));
    return Future.value(unit);
  }

  @override
  Future<List<MyCartItemModel>> getCachedMyCartItems() {
    final jsonString = sharedPreferences.getString(cachedMyCartItems);
    if (jsonString != null) {
      List<Map<String, dynamic>> decodeJsonData = json.decode(jsonString);
      List<MyCartItemModel> jsonToMyCartItemsModel = decodeJsonData
          .map<MyCartItemModel>(
              (myCartItemMap) => MyCartItemModel.fromMap(myCartItemMap))
          .toList();
      return Future.value(jsonToMyCartItemsModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
