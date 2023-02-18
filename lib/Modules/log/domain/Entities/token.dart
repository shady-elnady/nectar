import 'dart:convert';

import 'package:equatable/equatable.dart';

class Token extends Equatable {
  final String? refresh;
  final String access;

  const Token({
    this.refresh,
    required this.access,
  });

  Map<String, dynamic> toMap() => {
        'refresh': refresh,
        'access': access,
      };

  /// `dart:convert`
  ///
  /// Converts [Token] to a JSON string.
  String toJson() => json.encode(toMap());

  Token copyWith({
    String? refresh,
    required String access,
  }) {
    return Token(
      refresh: refresh ?? this.refresh,
      access: this.access,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        refresh,
        access,
      ];
}
