import 'dart:convert';

import 'package:nectar_mac/App/Entities/sub_base_entity.dart';

class Refund extends SubBaseEntity {
  final String order;
  final String? reason;
  final bool? isAccepted;
  final DateTime createdDate;
  final DateTime? lastUpdated;

  const Refund({
    required super.url,
    required this.order,
    this.reason,
    this.isAccepted,
    required this.createdDate,
    this.lastUpdated,
    required super.slug,
  });

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'order': order,
        'reason': reason,
        'is_accepted': isAccepted,
        'created_date': createdDate.toIso8601String(),
        'last_updated': lastUpdated?.toIso8601String(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [Refund] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  Refund copyWith({
    required String url,
    required String order,
    String? reason,
    bool? isAccepted,
    required DateTime createdDate,
    DateTime? lastUpdated,
    required String slug,
  }) {
    return Refund(
      url: this.url,
      order: this.order,
      reason: reason ?? this.reason,
      isAccepted: isAccepted ?? this.isAccepted,
      createdDate: this.createdDate,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      slug: this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      url,
      order,
      reason,
      isAccepted,
      createdDate,
      lastUpdated,
      slug,
    ];
  }
}
