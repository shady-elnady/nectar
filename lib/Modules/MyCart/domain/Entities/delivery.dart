import 'dart:convert';

import 'package:nectar_mac/App/Entities/sub_base_entity.dart';

class Delivery extends SubBaseEntity {
  final String deliveryMethod;
  final double? deliveryCost;

  const Delivery({
    required super.url,
    required this.deliveryMethod,
    this.deliveryCost,
    required super.slug,
  });

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'delivery_method': deliveryMethod,
        'delivery_cost': deliveryCost,
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [Delivery] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  Delivery copyWith({
    required String url,
    required String deliveryMethod,
    double? deliveryCost,
    required String slug,
  }) {
    return Delivery(
      url: this.url,
      deliveryMethod: this.deliveryMethod,
      deliveryCost: deliveryCost ?? this.deliveryCost,
      slug: this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        url,
        deliveryMethod,
        deliveryCost,
        slug,
      ];
}
