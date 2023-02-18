import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../Entities/log.dart';
import '../Repository/base_log_repository.dart';

class LogInUsecase {
  final BaseLogRepository logRepository;
  LogInUsecase({
    required this.logRepository,
  });

  Future<Either<Failure, Unit>> call({
    required Log logParameter,
  }) async {
    return await logRepository.logIn(
      logParameter: logParameter,
    );
  }
}
