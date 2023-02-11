import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../Exceptions/failure.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call({
    required Parameters parameters,
  });
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object> get props => [];
}
