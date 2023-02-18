import 'package:equatable/equatable.dart';

import '../Utils/Strings/messages.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({
    required this.message,
    this.statusCode,
  });

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    super.statusCode,
  });
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({
    required super.message,
    super.statusCode,
  });
}

class OfflineFailure extends Failure {
  const OfflineFailure({
    required super.message,
    super.statusCode,
  });
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure({
    required super.message,
    super.statusCode,
  });
}

class LogFailure extends Failure {
  const LogFailure({
    required super.message,
    super.statusCode,
  });
}

class EmptyCacheTokenFailure extends LogFailure {
  const EmptyCacheTokenFailure({
    required super.message,
    super.statusCode,
  });
}

@override
class FailureToMessage {
  static String call({
    required Failure failure,
  }) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Meassages.serverFailure;
      case EmptyCacheFailure:
        return Meassages.emptyCacheData;
      case OfflineFailure:
        return Meassages.offLineConnection;
      case EmptyCacheTokenFailure:
        return Meassages.emptyCacheToken;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
