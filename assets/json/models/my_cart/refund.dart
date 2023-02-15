import 'dart:convert';

import 'package:equatable/equatable.dart';

class Refund extends Equatable {
  final String? url;
  final String? order;
  final String? reason;
  final bool? isAccepted;
  final DateTime? createdDate;
  final DateTime? lastUpdated;
  final String? slug;

  const Refund({
    this.url,
    this.order,
    this.reason,
    this.isAccepted,
    this.createdDate,
    this.lastUpdated,
    this.slug,
  });

  factory Refund.fromMap(Map<String, dynamic> data) => Refund(
        url: data['url'] as String?,
        order: data['order'] as String?,
        reason: data['reason'] as String?,
        isAccepted: data['is_accepted'] as bool?,
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
        'order': order,
        'reason': reason,
        'is_accepted': isAccepted,
        'created_date': createdDate?.toIso8601String(),
        'last_updated': lastUpdated?.toIso8601String(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Refund].
  factory Refund.fromJson(String data) {
    return Refund.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Refund] to a JSON string.
  String toJson() => json.encode(toMap());

  Refund copyWith({
    String? url,
    String? order,
    String? reason,
    bool? isAccepted,
    DateTime? createdDate,
    DateTime? lastUpdated,
    String? slug,
  }) {
    return Refund(
      url: url ?? this.url,
      order: order ?? this.order,
      reason: reason ?? this.reason,
      isAccepted: isAccepted ?? this.isAccepted,
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
      order,
      reason,
      isAccepted,
      createdDate,
      lastUpdated,
      slug,
    ];
  }
}
