import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Utils/cached_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/token_model.dart';

abstract class BaseTokenLocalDataSource {
  Future<TokenModel> getCachedToken();
  Future<Unit> cacheToken({
    required TokenModel token,
  });
}

class TokenLocalDataSourceImpl implements BaseTokenLocalDataSource {
  final SharedPreferences sharedPreferences;

  TokenLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cacheToken({
    required TokenModel token,
  }) {
    sharedPreferences.setString(CachedPreference.token, token.toJson());
    return Future.value(unit);
  }

  @override
  Future<TokenModel> getCachedToken() {
    final String? jsonString =
        sharedPreferences.getString(CachedPreference.token);
    if (jsonString != null) {
      TokenModel? jsonToTokenModel = TokenModel.fromJson(jsonString);
      return Future.value(jsonToTokenModel);
    } else {
      throw EmptyCacheTokenException();
    }
  }
}
