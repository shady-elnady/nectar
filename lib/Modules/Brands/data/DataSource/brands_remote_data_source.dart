// import 'package:http/http.dart' as http;
// import 'package:nectar_mac/App/API/api_constance.dart';

// import 'package:nectar_mac/App/API/error_message_model.dart';
// import 'package:nectar_mac/App/Exceptions/exceptions.dart';
// import 'package:nectar_mac/App/Models/body_model.dart';

// import '../Models/department_model.dart';

// abstract class BaseDepartmentRemoteDataSource {
//   // Get All Departments
//   Future<List<DepartmentModel>> getAllDepartments();
//   // Get One Department
//   Future<DepartmentModel> getOneDepartment({required String slug});
// }

// class DepartmentRemoteDataSource implements BaseDepartmentRemoteDataSource {
//   final http.Client client;

//   DepartmentRemoteDataSource({required this.client});

//   // Get All Departments Implementation
//   @override
//   Future<List<DepartmentModel>> getAllDepartments() async {
//     http.Response response = await client.get(
//       Uri.parse(
//         ApiConstance.departmentsURL,
//       ),
//       headers: {"Content-Type": "application/json"},
//     );

//     if (response.statusCode == 200) {
//       BodyModel body = BodyModel.fromJson(response.body);

//       List<dynamic> results = body.results;

//       List<DepartmentModel> departments = results.map(
//         (dynamic department) {
//           return DepartmentModel.fromMap(department);
//         },
//       ).toList();

//       return departments;
//     } else {
//       throw ServerException(
//         errorMessageModel: ErrorMessageModel.fromJson(
//             const {"ServerException": "ServerException"}),
//       );
//     }
//   }

//   // Get One Department
//   @override
//   Future<DepartmentModel> getOneDepartment({required String slug}) async {
//     http.Response res = await client.get(
//       Uri.parse(
//         "${ApiConstance.departmentsURL}/$slug/",
//       ),
//     );
//     if (res.statusCode == 200) {
//       DepartmentModel department = DepartmentModel.fromJson(res.body);

//       return department;
//     } else {
//       throw "Unable to retrieve departments.";
//     }
//   }
// }
