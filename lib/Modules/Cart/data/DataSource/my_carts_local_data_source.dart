import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/my_cart_model.dart';

abstract class MyCartLocalDataSource {
  Future<List<MyCartModel>> getCachedMyCarts();
  Future<Unit> cacheMyCarts(List<MyCartModel> myCartsList);
}

const cachedMyCart = "CACHED_MYCARTS";

class MyCartLocalDataSourceImpl implements MyCartLocalDataSource {
  final SharedPreferences sharedPreferences;

  MyCartLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheMyCarts(List<MyCartModel> myCartsList) {
    List myCartsListToJson = myCartsList
        .map<Map<String, dynamic>>((myCart) => myCart.toMap())
        .toList();
    sharedPreferences.setString(cachedMyCart, json.encode(myCartsListToJson));
    return Future.value(unit);
  }

  @override
  Future<List<MyCartModel>> getCachedMyCarts() {
    final jsonString = sharedPreferences.getString(cachedMyCart);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<MyCartModel> jsonToMyCartsModel = decodeJsonData
          .map<MyCartModel>((jsonMyCart) => MyCartModel.fromJson(jsonMyCart))
          .toList();
      return Future.value(jsonToMyCartsModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
