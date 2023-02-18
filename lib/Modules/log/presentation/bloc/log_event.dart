part of 'log_bloc.dart';

abstract class LogEvent extends Equatable {
  const LogEvent();

  @override
  List<Object> get props => [];
}

class IsAuthenticatedEvent extends LogEvent {}

class LogInEvent extends LogEvent {
  final Log logParameter;

  const LogInEvent({
    required this.logParameter,
  });

  @override
  List<Object> get props => [
        logParameter,
      ];
}

class LogUpEvent extends LogEvent {
  final Log logParameter;

  const LogUpEvent({
    required this.logParameter,
  });

  @override
  List<Object> get props => [
        logParameter,
      ];
}

class LogOutEvent extends LogEvent {}
