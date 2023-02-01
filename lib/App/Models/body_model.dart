import 'dart:convert';

import 'package:equatable/equatable.dart';

class BodyModel<BaseModel> extends Equatable {
  final int? count;
  final String? next;
  final String? previous;
  final List<BaseModel?> results;

  const BodyModel({
    this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory BodyModel.fromMap(Map<String, dynamic> data) => BodyModel(
        count: data['count'] as int?,
        next: data['next'] as String?,
        previous: data['previous'] as String?,
        results: (data['results'])
            .map((Map<String, dynamic>? e) =>
                BaseModel.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results.map((BaseModel? e) => e!.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BodyModel].
  factory BodyModel.fromJson(String data) {
    return BodyModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BodyModel] to a JSON string.
  String toJson() => json.encode(toMap());

  BodyModel copyWith({
    int? count,
    String? next,
    String? previous,
    required List<BaseModel?> results,
  }) {
    return BodyModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: this.results,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        count,
        next,
        previous,
        results,
      ];
}
