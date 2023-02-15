import 'dart:convert';

import 'package:equatable/equatable.dart';

class PaymentMethod extends Equatable {
  final String? url;
  final String? name;
  final String? native;
  final String? emoji;
  final String? slug;

  const PaymentMethod({
    this.url,
    this.name,
    this.native,
    this.emoji,
    this.slug,
  });

  factory PaymentMethod.fromMap(Map<String, dynamic> data) => PaymentMethod(
        url: data['url'] as String?,
        name: data['name'] as String?,
        native: data['native'] as String?,
        emoji: data['emoji'] as String?,
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
        'native': native,
        'emoji': emoji,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentMethod].
  factory PaymentMethod.fromJson(String data) {
    return PaymentMethod.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PaymentMethod] to a JSON string.
  String toJson() => json.encode(toMap());

  PaymentMethod copyWith({
    String? url,
    String? name,
    String? native,
    String? emoji,
    String? slug,
  }) {
    return PaymentMethod(
      url: url ?? this.url,
      name: name ?? this.name,
      native: native ?? this.native,
      emoji: emoji ?? this.emoji,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, name, native, emoji, slug];
}
