import '../API/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });
}

class LogException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const LogException({
    required this.errorMessageModel,
  });
}

class LocalDatabaseException implements Exception {
  final String message;

  const LocalDatabaseException({
    required this.message,
  });
}

class EmptyCacheException implements Exception {}

class EmptyCacheTokenException implements Exception {}

class OfflineException implements Exception {}
