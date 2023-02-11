import 'package:equatable/equatable.dart';

import '../Utils/Strings/messages.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}

class OfflineFailure extends Failure {
  const OfflineFailure(super.message);
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure(super.message);
}

@override
class FailureToMessage {
  static String call(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Meassages.serverFailure;
      case EmptyCacheFailure:
        return Meassages.emptyCacheData;
      case OfflineFailure:
        return Meassages.offLineConnection;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
