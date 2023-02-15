import 'package:equatable/equatable.dart';

abstract class BaseEntity extends Equatable {
  final String url;

  const BaseEntity({
    required this.url,
  });

  @override
  String toString() {
    return 'OriginalEntity(url: $url)';
  }

  /// `dart:convert`
  /// Converts [BaseEntity] to a JSON string.
  String toJson();

  Map<String, dynamic> toMap();

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        url,
      ];
}
