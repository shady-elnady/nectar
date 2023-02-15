import 'base_entity.dart';

abstract class BaseEntityWithName extends BaseEntity {
  final String name;
  final String slug;

  const BaseEntityWithName({
    required super.url,
    required this.name,
    required this.slug,
  });

  @override
  String toString() {
    return 'BaseEntityWithName(url: $url, name: $name, slug: $slug)';
  }

  /// `dart:convert`
  /// Converts [BaseEntityWithName] to a JSON string.
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
