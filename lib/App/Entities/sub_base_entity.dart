import 'base_entity.dart';

abstract class SubBaseEntity extends BaseEntity {
  final String slug;

  const SubBaseEntity({
    required super.url,
    required this.slug,
  });

  @override
  String toString() {
    return 'SubBaseEntity(url: $url, slug: $slug)';
  }

  /// `dart:convert`
  /// Converts [SubBaseEntity] to a JSON string.
  @override
  String toJson();

  @override
  Map<String, dynamic> toMap();

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        url,
        slug,
      ];
}
