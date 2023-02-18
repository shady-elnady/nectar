part of 'log_bloc.dart';

abstract class LogState extends Equatable {
  const LogState();

  @override
  List<Object> get props => [];
}

class InitialLogState extends LogState {}

class LoadingLogState extends LogState {}

class ErrorLogState extends LogState {
  final String message;

  const ErrorLogState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class MeassageLogState extends LogState {
  final String message;

  const MeassageLogState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
