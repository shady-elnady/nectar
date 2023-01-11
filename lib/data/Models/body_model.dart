// To parse this JSON data, do
//
//     final body = bodyFromMap(jsonString);

import 'dart:convert';

import 'result_model.dart';

class Body {
  Body({
    this.count,
    this.next,
    this.previous,
    required this.results,
  });

  final int? count;
  final String? next;
  final String? previous;
  final List<Result?> results;

  Body copyWith({
    int? count,
    String? next,
    String? previous,
    List<Result?>? results,
  }) =>
      Body(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results,
      );

  factory Body.fromJson(String str) => Body.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Body.fromMap(Map<String, dynamic> json) => Body(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : json["results"] == null
                ? []
                : List<Result?>.from(
                    json["results"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x!.toMap())),
      };
}
