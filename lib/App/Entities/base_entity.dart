import 'original_entity.dart';

abstract class BaseEntity extends OriginalEntity {
  final String name;

  const BaseEntity({
    required super.url,
    required this.name,
    required super.slug,
  });

  @override
  String toString() {
    return 'BaseEntity(url: $url, name: $name, slug: $slug)';
  }

  /// `dart:convert`
  /// Converts [BaseEntity] to a JSON string.
  @override
  String toJson();

  @override
  Map<String, dynamic> toMap();

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        url,
        name,
        slug,
      ];
}
