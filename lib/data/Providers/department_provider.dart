import 'package:http/http.dart' as http;

import '../Models/body_model.dart';
import '../Models/department_model.dart';
import '../Models/result_model.dart';

const appBaseUrl = 'http://10.0.0.2:8000';

class DepartmentApi {
  final String _departmentsUrl = "/api/departments";

  // Get All Departments
  Future<List<Department>> getAll() async {
    http.Response res = await http.get(
      Uri.https(
        appBaseUrl,
        _departmentsUrl,
        {},
      ),
    );

    if (res.statusCode == 200) {
      List<Result?> results = Body.fromJson(res.body).results;

      List<Department> departments = results
          .map(
            (dynamic department) => Department.fromJson(res.body),
          )
          .toList();

      return departments;
    } else {
      throw "Unable to retrieve departments.";
    }
  }

  // Get One Department
  Future<Department> getOne({required String slug}) async {
    http.Response res = await http.get(
      Uri.https(
        appBaseUrl,
        _departmentsUrl,
        {'slug': slug},
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
