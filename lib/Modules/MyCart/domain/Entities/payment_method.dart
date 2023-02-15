import 'dart:convert';

import 'package:nectar_mac/App/Entities/base_entity_name.dart';

class PaymentMethod extends BaseEntityWithName {
  final String? native;
  final String? emoji;

  const PaymentMethod({
    required super.url,
    required super.name,
    this.native,
    this.emoji,
    required super.slug,
  });

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'emoji': emoji,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [PaymentMethod] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  PaymentMethod copyWith({
    required String url,
    required String name,
    String? native,
    String? emoji,
    required String slug,
  }) {
    return PaymentMethod(
      url: this.url,
      name: this.name,
      native: native ?? this.native,
      emoji: emoji ?? this.emoji,
      slug: this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, name, native, emoji, slug];
}
