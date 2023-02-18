import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../Repository/base_log_repository.dart';

class IsAuthenticatedUsecase {
  final BaseLogRepository logRepository;
  IsAuthenticatedUsecase({
    required this.logRepository,
  });

  Future<Either<Failure, Unit>> call() async {
    return await logRepository.isAuthenticated();
  }
}
