import 'dart:convert';

import 'package:nectar_mac/App/Entities/sub_base_entity.dart';

class PromoCode extends SubBaseEntity {
  final String coupon;
  final double discount;
  final String? endTime;
  final DateTime createdDate;
  final DateTime? lastUpdated;

  const PromoCode({
    required super.url,
    required this.coupon,
    required this.discount,
    this.endTime,
    required this.createdDate,
    this.lastUpdated,
    required super.slug,
  });

  @override
  Map<String, dynamic> toMap() => {
        'url': url,
        'coupon': coupon,
        'discount': discount,
        'end_time': endTime,
        'created_date': createdDate.toIso8601String(),
        'last_updated': lastUpdated?.toIso8601String(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Converts [PromoCode] to a JSON string.
  @override
  String toJson() => json.encode(toMap());

  PromoCode copyWith({
    required String url,
    required String coupon,
    required double discount,
    String? endTime,
    required DateTime createdDate,
    DateTime? lastUpdated,
    required String slug,
  }) {
    return PromoCode(
      url: this.url,
      coupon: this.coupon,
      discount: this.discount,
      endTime: endTime ?? this.endTime,
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
      coupon,
      discount,
      endTime,
      createdDate,
      lastUpdated,
      slug,
    ];
  }
}
