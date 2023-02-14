import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/my_basket_item_model.dart';

abstract class MyBasketItemLocalDataSource {
  Future<Unit> cacheMyBasketItems({
    required List<MyBasketItemModel> myBasketItemsList,
  });
  Future<List<MyBasketItemModel>> getCachedMyBasketItems();
}

const cachedMyBasketItems = "CACHED_MY_BASKET_ITEMS";

class MyBasketItemLocalDataSourceImpl implements MyBasketItemLocalDataSource {
  final SharedPreferences sharedPreferences;

  MyBasketItemLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheMyBasketItems({
    required List<MyBasketItemModel> myBasketItemsList,
  }) {
    List myBasketItemsListToJson = myBasketItemsList
        .map<Map<String, dynamic>>((item) => item.toMap())
        .toList();
    sharedPreferences.setString(
        cachedMyBasketItems, json.encode(myBasketItemsListToJson));
    return Future.value(unit);
  }

  @override
  Future<List<MyBasketItemModel>> getCachedMyBasketItems() {
    final jsonString = sharedPreferences.getString(cachedMyBasketItems);
    if (jsonString != null) {
      List<Map<String, dynamic>> decodeJsonData = json.decode(jsonString);
      List<MyBasketItemModel> jsonToMyBasketItemsModel = decodeJsonData
          .map<MyBasketItemModel>(
              (myBasketItemMap) => MyBasketItemModel.fromMap(myBasketItemMap))
          .toList();
      return Future.value(jsonToMyBasketItemsModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
