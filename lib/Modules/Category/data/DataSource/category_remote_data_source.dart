import 'package:http/http.dart' as http;
import 'package:nectar_mac/App/API/api_constance.dart';

import 'package:nectar_mac/App/API/error_message_model.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Models/body_model.dart';

import '../Models/category_model.dart';

abstract class BaseCategoryRemoteDataSource {
  // Get All Departments
  Future<List<CategoryModel>> getAllCategories();
  // Get One Department
  Future<CategoryModel> getOneCategory({required String slug});
}

class CategoriesRemoteDataSource implements BaseCategoryRemoteDataSource {
  final http.Client client;
  CategoriesRemoteDataSource({
    required this.client,
  });

  Map<String, String>? headers = {
    "Content-Type": "application/json",
    // "Authorization": "Bearer ${}",
  };

  // Get All Departments Implementation
  @override
  Future<List<CategoryModel>> getAllCategories() async {
    http.Response response = await client.get(
      Uri.parse(
        ApiConstance.categoriesURL,
      ),
      headers: headers,
    );

    if (response.statusCode == 200) {
      BodyModel body = BodyModel.fromJson(response.body);

      List<dynamic> results = body.results;

      List<CategoryModel> categories = results.map(
        (dynamic category) {
          return CategoryModel.fromMap(category);
        },
      ).toList();

      return categories;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
            const {"ServerException": "ServerException"}),
      );
    }
  }

  // Get One Department
  @override
  Future<CategoryModel> getOneCategory({required String slug}) async {
    http.Response res = await client.get(
      Uri.parse(
        "${ApiConstance.categoriesURL}/$slug/",
      ),
    );
    if (res.statusCode == 200) {
      CategoryModel category = CategoryModel.fromJson(res.body);

      return category;
    } else {
      throw "Unable to retrieve departments.";
    }
  }
}
