import 'dart:convert';

import 'package:equatable/equatable.dart';

class Age extends Equatable {
  final int year;
  final int month;
  final int day;

  const Age({
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  String toString() => 'Age(year: $year, month: $month, day: $day)';

  /// `dart:convert`
  ///
  /// Converts [Age] to a JSON string.
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'year': year,
        'month': month,
        'day': day,
      };

  Age copyWith({
    required int year,
    required int month,
    required int day,
  }) {
    return Age(
      year: this.year,
      month: this.month,
      day: this.day,
    );
  }

  @override
  List<Object?> get props => [
        year,
        month,
        day,
      ];
}
