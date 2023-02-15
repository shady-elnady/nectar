import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import '../Models/my_cart_model.dart';

abstract class MyCartLocalDataSource {
  Future<MyCartModel> getCachedMyCart();
  Future<Unit> cacheMyCart({
    required MyCartModel myCart,
  });
}

const cachedMyCart = "CACHED_MY_CART";

class MyCartLocalDataSourceImpl implements MyCartLocalDataSource {
  final SharedPreferences sharedPreferences;

  MyCartLocalDataSourceImpl({
    required this.sharedPreferences,
  });
  @override
  Future<Unit> cacheMyCart({
    required MyCartModel myCart,
  }) {
    sharedPreferences.setString(cachedMyCart, myCart.toJson());
    return Future.value(unit);
  }

  @override
  Future<MyCartModel> getCachedMyCart() {
    try {
      return Future.value(
        MyCartModel.fromJson(
          sharedPreferences.getString(cachedMyCart)!,
        ),
      );
    } on Exception {
      throw EmptyCacheException();
    }
  }
}
