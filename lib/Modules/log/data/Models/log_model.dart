import 'dart:convert';

import '../../domain/Entities/log.dart';

class LogModel extends Log {
  const LogModel({
    super.username,
    required super.email,
    required super.password,
    super.password1,
  });

  factory LogModel.fromMap(Map<String, dynamic> data) => LogModel(
        username: data['username'] as String?,
        email: data['email'] as String,
        password: data['password'] as String,
        password1: data['password1'] as String?,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LogModel].
  factory LogModel.fromJson(String data) {
    return LogModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
