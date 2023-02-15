import 'dart:convert';

import '../../domain/Entities/delivery.dart';

class DeliveryModel extends Delivery {
  const DeliveryModel({
    required super.url,
    required super.deliveryMethod,
    super.deliveryCost,
    required super.slug,
  });

  factory DeliveryModel.fromMap(Map<String, dynamic> data) => DeliveryModel(
        url: data['url'] as String,
        deliveryMethod: data['delivery_method'] as String,
        deliveryCost: data['delivery_cost'] as double?,
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DeliveryModel].
  factory DeliveryModel.fromJson(String data) {
    return DeliveryModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
