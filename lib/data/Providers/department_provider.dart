import 'package:http/http.dart' as http;
import 'package:nectar_mac/config/app_api.dart';

import '../Models/body.dart';
import '../../Modules/Department/domain/Entities/department.dart';

class DepartmentApi {
  final String _departmentsUrl = "/departments";

  // Get All Departments
  Future<List<Department>> getAll() async {
    http.Response res = await http.get(
      Uri.parse(
        AppAPI.appBaseUrl + _departmentsUrl,
      ),
    );

    if (res.statusCode == 200) {
      Body body = Body.fromJson(res.body);

      List<dynamic> results = body.results;

      List<Department> departments = results.map(
        (dynamic department) {
          return Department.fromMap(department);
        },
      ).toList();

      return departments;
    } else {
      throw "Unable to retrieve departments.";
    }
  }

  // Get One Department
  Future<Department> getOne({required String slug}) async {
    http.Response res = await http.get(
      Uri.parse(
        "${AppAPI.appBaseUrl}/$_departmentsUrl$slug/",
        // "http://127.0.0.1:8000/api/departments/Exclusive%20Offer/",
      ),
    );
    if (res.statusCode == 200) {
      Department department = Department.fromJson(res.body);

      return department;
    } else {
      throw "Unable to retrieve departments.";
    }
  }

  // delete(String slug) {
  //   return departmentApi.delete(id);
  // }

  // update(Department department) {
  //   return departmentApi.edit(department);
  // }

  // create(Department department) {
  //   return departmentApi.add(department);
  // }

// // Post request
//   Future<Response> postUser(Map data) =>
//       post('http://youapi/users', body: data);
// // Post request with File
//   Future<Response<CasesModel>> postCases(List<int> image) {
//     final form = FormData({
//       'file': MultipartFile(image, filename: 'avatar.png'),
//       'otherFile': MultipartFile(image, filename: 'cover.png'),
//     });
//     return post('http://youapi/users/upload', form);
//   }
}


/**
 // ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:collection/collection.dart';

abstract class JsonMap {
  Map<String, dynamic> toJson();
  Map<String, dynamic> toMap();
  JsonMap fromJson(Map<String, dynamic> data);
  external factory JsonMap.fromMap(Map<String, dynamic> data);
}

@immutable
class Body<T extends JsonMap> {
  final int? count;
  final String? next;
  final String? previous;
  final List<T?> results;

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

  factory Body.fromMap(Map<String, dynamic> data, T) => Body(
        count: data['count'] as int?,
        next: data['next'] as String?,
        previous: data['previous'] as String?,
        results: data['results']
            .map((Map<String, dynamic>? e) => T.fromMap(e))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results.map((T? e) => e!.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Body].
  factory Body.fromJson(String data) {
    return Body.fromMap(json.decode(data) as Map<String, dynamic>, T);
  }

  /// `dart:convert`
  ///
  /// Converts [Body] to a JSON string.
  String toJson() => json.encode(toMap());

  Body copyWith({
    int? count,
    String? next,
    String? previous,
    required List<T?> results,
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


*/


// Old 
/**
 // ignore_for_file: depend_on_referenced_packages

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

 */