import 'dart:convert';

import 'package:equatable/equatable.dart';

class Log extends Equatable {
  final String? username;
  final String email;
  final String password;
  final String? password1;

  const Log({
    this.username,
    required this.email,
    required this.password,
    this.password1,
  });

  Map<String, dynamic> toMap() => {
        'username': username,
        'email': email,
        'password': password,
        'password1': password1,
      };

  /// `dart:convert`
  ///
  /// Converts [Log] to a JSON string.
  String toJson() => json.encode(toMap());

  Log copyWith({
    String? username,
    required String email,
    required String password,
    String? password1,
  }) {
    return Log(
      username: username ?? this.username,
      email: this.email,
      password: this.password,
      password1: password1 ?? this.password1,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        username,
        email,
        password,
        password1,
      ];
}
