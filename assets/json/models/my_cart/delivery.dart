import 'dart:convert';

import 'package:equatable/equatable.dart';

class Delivery extends Equatable {
  final String? url;
  final String? deliveryMethod;
  final int? deliveryCost;
  final String? slug;

  const Delivery({
    this.url,
    this.deliveryMethod,
    this.deliveryCost,
    this.slug,
  });

  factory Delivery.fromMap(Map<String, dynamic> data) => Delivery(
        url: data['url'] as String?,
        deliveryMethod: data['delivery_method'] as String?,
        deliveryCost: data['delivery_cost'] as int?,
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'delivery_method': deliveryMethod,
        'delivery_cost': deliveryCost,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Delivery].
  factory Delivery.fromJson(String data) {
    return Delivery.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Delivery] to a JSON string.
  String toJson() => json.encode(toMap());

  Delivery copyWith({
    String? url,
    String? deliveryMethod,
    int? deliveryCost,
    String? slug,
  }) {
    return Delivery(
      url: url ?? this.url,
      deliveryMethod: deliveryMethod ?? this.deliveryMethod,
      deliveryCost: deliveryCost ?? this.deliveryCost,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, deliveryMethod, deliveryCost, slug];
}
