import 'dart:convert';

import '../../domain/Entities/applicatins.dart';
import 'platform_model.dart';

class ApplicationModel extends Application {
  const ApplicationModel({
    required super.url,
    required super.name,
    super.native,
    super.platform,
    required super.slug,
  });

  factory ApplicationModel.fromMap(Map<String, dynamic> data) {
    return ApplicationModel(
      url: data['url'] as String,
      name: data['name'] as String,
      native: data['native'] as String?,
      platform: data['platform'] == null
          ? null
          : PlatformModel.fromMap(data['platform'] as Map<String, dynamic>),
      slug: data['slug'] as String,
    );
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ApplicationModel].
  factory ApplicationModel.fromJson(String data) {
    return ApplicationModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
