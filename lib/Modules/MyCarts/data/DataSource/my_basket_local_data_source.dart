import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import '../Models/my_basket_model.dart';

abstract class MyBasketLocalDataSource {
  Future<MyBasketModel> getCachedMyBasket();
  Future<Unit> cacheMyBasket({
    required MyBasketModel myBasket,
  });
}

const cachedMyBasket = "CACHED_MY_BASKET";

class MyBasketLocalDataSourceImpl implements MyBasketLocalDataSource {
  final SharedPreferences sharedPreferences;

  MyBasketLocalDataSourceImpl({
    required this.sharedPreferences,
  });
  @override
  Future<Unit> cacheMyBasket({
    required MyBasketModel myBasket,
  }) {
    sharedPreferences.setString(cachedMyBasket, myBasket.toJson());
    return Future.value(unit);
  }

  @override
  Future<MyBasketModel> getCachedMyBasket() {
    try {
      return Future.value(
        MyBasketModel.fromJson(
          sharedPreferences.getString(cachedMyBasket)!,
        ),
      );
    } on Exception {
      throw EmptyCacheException();
    }
  }
}
