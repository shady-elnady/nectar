import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../Entities/log.dart';

abstract class BaseLogRepository {
  Future<Either<Failure, Unit>> logIn({
    required Log logParameter,
  });
  Future<Either<Failure, Unit>> logUp({
    required Log logParameter,
  });

  Future<Either<Failure, Unit>> isAuthenticated();
}
