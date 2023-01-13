import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@immutable
class Body {
  final int? count;
  final dynamic next;
  final dynamic previous;
  final List<dynamic> results;

  const Body({
    this.count,
    this.next,
    this.previous,
    required this.results,
  });

  @override
  String toString() {
    return 'Body(count: $count, next: $next, previous: $previous, results: $results)';
  }

  factory Body.fromMap(Map<String, dynamic> data) => Body(
        count: data['count'] as int?,
        next: data['next'] as dynamic,
        previous: data['previous'] as dynamic,
        results: data['results'] as List<dynamic>,
      );

  Map<String, dynamic> toMap() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Body].
  factory Body.fromJson(String data) {
    return Body.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Body] to a JSON string.
  String toJson() => json.encode(toMap());

  Body copyWith({
    int? count,
    dynamic next,
    dynamic previous,
    required List<dynamic> results,
  }) {
    return Body(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: this.results,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Body) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      count.hashCode ^ next.hashCode ^ previous.hashCode ^ results.hashCode;
}
