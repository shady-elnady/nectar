import 'dart:convert';

import 'package:equatable/equatable.dart';

class Log extends Equatable {
  final String? username;
  final String email;
  final String password;

  const Log({
    this.username,
    required this.email,
    required this.password,
  });

  @override
  String toString() =>
      'Log(username: $username, email: $email, password: $password)';

  /// `dart:convert`
  ///
  /// Converts [Log] to a JSON string.
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'username': username,
        'email': email,
        'password': password,
      };

  Log copyWith({
    String? username,
    required String email,
    required String month,
  }) {
    return Log(
      username: username ?? this.username,
      email: this.email,
      password: password,
    );
  }

  @override
  List<Object?> get props => [
        username,
        email,
        password,
      ];
}
