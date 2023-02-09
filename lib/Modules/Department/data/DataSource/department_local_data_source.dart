import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/department_model.dart';

abstract class DepartmentLocalDataSource {
  Future<List<DepartmentModel>> getCachedDepartments();
  Future<Unit> cacheDepartments(List<DepartmentModel> departmentsList);
}

const cachedDepartment = "CACHED_DEPARTMENTS";

class DepartmentLocalDataSourceImpl implements DepartmentLocalDataSource {
  final SharedPreferences sharedPreferences;

  DepartmentLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheDepartments(List<DepartmentModel> departmentsList) {
    List departmentsListToJson = departmentsList
        .map<Map<String, dynamic>>((department) => department.toMap())
        .toList();
    sharedPreferences.setString(
        cachedDepartment, json.encode(departmentsListToJson));
    return Future.value(unit);
  }

  @override
  Future<List<DepartmentModel>> getCachedDepartments() {
    final jsonString = sharedPreferences.getString(cachedDepartment);
    if (jsonString != null) {
      List<Map<String, dynamic>> decodeJsonData = json.decode(jsonString);
      List<DepartmentModel> jsonToDepartmentsModel = decodeJsonData
          .map<DepartmentModel>(
              (jsonDepartment) => DepartmentModel.fromMap(jsonDepartment))
          .toList();
      return Future.value(jsonToDepartmentsModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
