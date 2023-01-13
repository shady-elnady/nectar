import 'package:http/http.dart' as http;
import 'package:nectar_mac/config/app_api.dart';

import '../Models/body.dart';
import '../Models/department.dart';

class DepartmentApi {
  final String _departmentsUrl = "/api/departments/";

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
        "${AppAPI.appBaseUrl}$_departmentsUrl$slug/",
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
