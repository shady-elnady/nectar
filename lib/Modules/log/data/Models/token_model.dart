import 'dart:convert';

import '../../domain/Entities/token.dart';

class TokenModel extends Token {
  const TokenModel({
    super.refresh,
    required super.access,
  });

  factory TokenModel.fromMap(Map<String, dynamic> data) => TokenModel(
        refresh: data['refresh'] as String?,
        access: data['access'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TokenModel].
  factory TokenModel.fromJson(String data) {
    return TokenModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
