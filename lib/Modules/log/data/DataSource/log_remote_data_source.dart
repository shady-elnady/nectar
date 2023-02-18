import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:nectar_mac/App/API/api_constance.dart';
import 'package:nectar_mac/App/API/error_message_model.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';

import '../../domain/Entities/log.dart';
import '../../domain/Entities/token.dart';
import '../Models/token_model.dart';

abstract class BaseLogRemoteDataSource {
  Future<TokenModel> logIn({
    required Log logParameter,
  });
  Future<TokenModel> refreshToken({
    required Token token,
  });
  Future<TokenModel> verifyToken({
    required Token token,
  });
  // Sign Up
  Future<TokenModel> logUp({
    required Log logParameter,
  });

  Future<Unit> logOut();
}

class LogRemoteDataSource implements BaseLogRemoteDataSource {
  final http.Client client;
  LogRemoteDataSource({
    required this.client,
  });

  Map<String, String>? headers = {
    "Content-Type": "application/json",
  };

  @override
  Future<TokenModel> logIn({
    required Log logParameter,
  }) async {
    Object body = {
      "email": logParameter.email,
      "password": logParameter.password,
    };
    http.Response res = await client.post(
      Uri.parse(
        ApiConstance.tokenURL,
      ),
      headers: headers,
      body: body,
    );
    if (res.statusCode == 200) {
      TokenModel token = TokenModel.fromJson(res.body);
      return token;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
            const {"ServerException": "ServerException"}),
      );
    }
  }

  @override
  Future<TokenModel> refreshToken({
    required Token token,
  }) async {
    Object body = {
      "refresh": token.refresh,
    };
    http.Response res = await client.post(
      Uri.parse(
        ApiConstance.refreshTokenURL,
      ),
      headers: headers,
      body: body,
    );
    if (res.statusCode == 200) {
      TokenModel token = TokenModel.fromJson(res.body);
      return token;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
            const {"ServerException": "ServerException"}),
      );
    }
  }

  @override
  Future<TokenModel> logUp({
    required Log logParameter,
  }) async {
    Object body = {
      "email": logParameter.email,
      "password1": logParameter.password,
      "password2": logParameter.password1,
    };
    http.Response res = await client.post(
      Uri.parse(
        ApiConstance.signUpURL,
      ),
      headers: headers,
      body: body,
    );
    if (res.statusCode == 200) {
      TokenModel token = TokenModel.fromJson(res.body);
      return token;
    } else {
      return throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
            const {"ServerException": "ServerException"}),
      );
    }
  }

  @override
  Future<Unit> logOut() async {
    http.Response res = await client.post(
      Uri.parse(
        ApiConstance.logOutURL,
      ),
      headers: headers,
    );
    if (res.statusCode == 200) {
      TokenModel token = TokenModel.fromJson(res.body);
      // ignore: avoid_print
      print(token);
      return Future.value(unit);
    } else {
      return throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
            const {"ServerException": "ServerException"}),
      );
    }
  }

  @override
  Future<TokenModel> verifyToken({
    required Token token,
  }) async {
    throw UnimplementedError();
  }
}
