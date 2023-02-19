import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';

import '../../domain/Entities/log.dart';
import '../../domain/UseCases/index.dart';

part 'log_event.dart';
part 'log_state.dart';

class LogBloc extends Bloc<LogEvent, LogState> {
  final IsAuthenticatedUsecase isAuthenticatedUsecase;
  final LogInUsecase logInUsecase;
  final LogUpUsecase logUpUsecase;
  LogBloc({
    required this.logInUsecase,
    required this.logUpUsecase,
    required this.isAuthenticatedUsecase,
  }) : super(InitialLogState()) {
    on<LogEvent>((event, emit) async {
      if (event is IsAuthenticatedEvent) {
        emit(LoadingLogState());

        final failureOrDoneMessage = await isAuthenticatedUsecase();

        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            Meassages.isAuthenticatedUser,
          ),
        );
      } else if (event is LogInEvent) {
        emit(LoadingLogState());

        final failureOrDoneMessage = await logInUsecase(
          logParameter: event.logParameter,
        );

        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            Meassages.logInSuccess,
          ),
        );
      } else if (event is LogUpEvent) {
        emit(LoadingLogState());

        final failureOrDoneMessage = await logUpUsecase(
          logParameter: event.logParameter,
        );

        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            Meassages.logUpSuccess,
          ),
        );
      }
    });
  }
  LogState _eitherDoneMessageOrErrorState(
    Either<Failure, Unit> either,
    String message,
  ) {
    return either.fold(
      (failure) => ErrorLogState(
        message: FailureToMessage.call(
          failure: failure,
        ),
      ),
      (_) => MeassageLogState(
        message: message,
      ),
    );
  }
}
