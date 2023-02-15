import 'dart:convert';

import '../../domain/Entities/refund.dart';

class RefundModel extends Refund {
  const RefundModel({
    required super.url,
    required super.order,
    super.reason,
    super.isAccepted,
    required super.createdDate,
    super.lastUpdated,
    required super.slug,
  });

  factory RefundModel.fromMap(Map<String, dynamic> data) => RefundModel(
        url: data['url'] as String,
        order: data['order'] as String,
        reason: data['reason'] as String?,
        isAccepted: data['is_accepted'] as bool?,
        createdDate: DateTime.parse(data['created_date'] as String),
        lastUpdated: data['last_updated'] == null
            ? null
            : DateTime.parse(data['last_updated'] as String),
        slug: data['slug'] as String,
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RefundModel].
  factory RefundModel.fromJson(String data) {
    return RefundModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
