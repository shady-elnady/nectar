import 'package:dartz/dartz.dart';

import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Services/network_services.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';
import 'package:nectar_mac/Modules/log/domain/Entities/log.dart';

import '../../domain/Repository/base_log_repository.dart';
import '../DataSource/log_remote_data_source.dart';
import '../DataSource/token_local_data_source.dart';
import '../Models/token_model.dart';

class LogRepository extends BaseLogRepository {
  final BaseLogRemoteDataSource remoteLogDataSource;
  final BaseTokenLocalDataSource localTokenDataSource;
  final NetworkService networkService;

  LogRepository({
    required this.remoteLogDataSource,
    required this.localTokenDataSource,
    required this.networkService,
  });

  @override
  Future<Either<Failure, Unit>> logIn({
    required Log logParameter,
  }) async {
    if (await networkService.isConnected) {
      try {
        TokenModel remoteToken =
            await remoteLogDataSource.logIn(logParameter: logParameter);
        localTokenDataSource.cacheToken(token: remoteToken);
        return const Right(unit);
      } on ServerException catch (failure) {
        return Left(
          ServerFailure(
            message: failure.errorMessageModel.statusMessage,
          ),
        );
      } on LogException catch (failure) {
        return Left(
          LogFailure(
            message: failure.errorMessageModel.statusMessage,
            statusCode: failure.errorMessageModel.statusCode,
          ),
        );
      }
    } else {
      try {
        TokenModel localToken = await localTokenDataSource.getCachedToken();
        return const Right(unit);
      } on EmptyCacheException {
        return const Left(
          EmptyCacheFailure(
            message: Meassages.emptyCacheData,
          ),
        );
      } on EmptyCacheTokenException {
        return const Left(
          EmptyCacheTokenFailure(
            message: Meassages.emptyCacheData,
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> logUp({required Log logParameter}) {
    // TODO: implement logUp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> isAuthenticated() async {
    try {
      await localTokenDataSource.getCachedToken();
      return const Right(unit);
    } on EmptyCacheTokenException {
      return const Left(
        EmptyCacheFailure(
          message: Meassages.emptyCacheData,
        ),
      );
    }
  }
}
