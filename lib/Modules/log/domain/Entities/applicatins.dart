import 'dart:convert';

import '../../../../App/Entities/base_entity.dart';
import 'platform.dart';

class Application extends BaseEntity {
  final String? native;
  final Platform? platform;

  const Application({
    required super.url,
    required super.name,
    this.native,
    this.platform,
    required super.slug,
  });

  @override
  String toString() {
    return 'Application(url: $url, name: $name, native: $native, platform: $platform, slug: $slug)';
  }

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'platform': platform?.toMap(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [Application] to a JSON string.
  String toJson() => json.encode(toMap());

  Application copyWith({
    required String url,
    required String name,
    String? native,
    Platform? platform,
    required String slug,
  }) {
    return Application(
      url: this.url,
      name: this.name,
      native: native ?? this.native,
      platform: platform ?? this.platform,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        name,
        native,
        platform,
        slug,
      ];
}
