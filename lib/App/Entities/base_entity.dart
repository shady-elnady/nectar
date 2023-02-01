import 'package:equatable/equatable.dart';

class BaseEntity extends Equatable {
  final String url;
  final String name;
  final String slug;

  const BaseEntity({
    required this.url,
    required this.name,
    required this.slug,
  });

  @override
  String toString() {
    return 'BaseEntity(url: $url, name: $name, slug: $slug)';
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        url,
        name,
        slug,
      ];
}
