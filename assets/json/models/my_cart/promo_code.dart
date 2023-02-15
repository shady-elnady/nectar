import 'dart:convert';

import 'package:equatable/equatable.dart';

class PromoCode extends Equatable {
  final String? url;
  final int? coupon;
  final int? discount;
  final String? endTime;
  final DateTime? createdDate;
  final DateTime? lastUpdated;
  final String? slug;

  const PromoCode({
    this.url,
    this.coupon,
    this.discount,
    this.endTime,
    this.createdDate,
    this.lastUpdated,
    this.slug,
  });

  factory PromoCode.fromMap(Map<String, dynamic> data) => PromoCode(
        url: data['url'] as String?,
        coupon: data['coupon'] as int?,
        discount: data['discount'] as int?,
        endTime: data['end_time'] as String?,
        createdDate: data['created_date'] == null
            ? null
            : DateTime.parse(data['created_date'] as String),
        lastUpdated: data['last_updated'] == null
            ? null
            : DateTime.parse(data['last_updated'] as String),
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'coupon': coupon,
        'discount': discount,
        'end_time': endTime,
        'created_date': createdDate?.toIso8601String(),
        'last_updated': lastUpdated?.toIso8601String(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PromoCode].
  factory PromoCode.fromJson(String data) {
    return PromoCode.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PromoCode] to a JSON string.
  String toJson() => json.encode(toMap());

  PromoCode copyWith({
    String? url,
    int? coupon,
    int? discount,
    String? endTime,
    DateTime? createdDate,
    DateTime? lastUpdated,
    String? slug,
  }) {
    return PromoCode(
      url: url ?? this.url,
      coupon: coupon ?? this.coupon,
      discount: discount ?? this.discount,
      endTime: endTime ?? this.endTime,
      createdDate: createdDate ?? this.createdDate,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      slug: slug ?? this.slug,
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
