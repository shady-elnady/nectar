// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:collection/collection.dart';

@immutable
class Age {
  final int? year;
  final int? month;
  final int? day;

  const Age({this.year, this.month, this.day});

  @override
  String toString() => 'Age(year: $year, month: $month, day: $day)';

  factory Age.fromMap(Map<String, dynamic> data) => Age(
        year: data['year'] as int?,
        month: data['month'] as int?,
        day: data['day'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'year': year,
        'month': month,
        'day': day,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Age].
  factory Age.fromJson(String data) {
    return Age.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Age] to a JSON string.
  String toJson() => json.encode(toMap());

  Age copyWith({
    int? year,
    int? month,
    int? day,
  }) {
    return Age(
      year: year ?? this.year,
      month: month ?? this.month,
      day: day ?? this.day,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Age) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => year.hashCode ^ month.hashCode ^ day.hashCode;
}
