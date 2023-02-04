import 'package:equatable/equatable.dart';

abstract class OriginalEntity extends Equatable {
  final String url;
  final String slug;

  const OriginalEntity({
    required this.url,
    required this.slug,
  });

  @override
  String toString() {
    return 'OriginalEntity(url: $url, slug: $slug)';
  }

  /// `dart:convert`
  /// Converts [OriginalEntity] to a JSON string.
  String toJson();

  Map<String, dynamic> toMap();

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        url,
        slug,
      ];
}
