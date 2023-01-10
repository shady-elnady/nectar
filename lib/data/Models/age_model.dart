import 'dart:convert';

class Age {
  Age({
    required this.year,
    required this.month,
    required this.day,
  });

  final int year;
  final int month;
  final int day;

  Age copyWith({
    int? year,
    int? month,
    int? day,
  }) =>
      Age(
        year: year ?? this.year,
        month: month ?? this.month,
        day: day ?? this.day,
      );

  factory Age.fromJson(String str) => Age.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Age.fromMap(Map<String, dynamic> json) => Age(
        year: json["year"],
        month: json["month"],
        day: json["day"],
      );

  Map<String, dynamic> toMap() => {
        "year": year,
        "month": month,
        "day": day,
      };
}
