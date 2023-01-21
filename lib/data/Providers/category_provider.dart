import 'package:http/http.dart' as http;
import 'package:nectar_mac/config/app_api.dart';

import '../Models/body.dart';
import '../Models/category.dart';

class CategoryApi {
  final String _categoriesUrl = "/categories/";

  // Get All Categories
  Future<List<Category>> getAll() async {
    http.Response res = await http.get(
      Uri.parse(
        AppAPI.appBaseUrl + _categoriesUrl,
      ),
    );

    if (res.statusCode == 200) {
      Body body = Body.fromJson(res.body);

      List<dynamic> results = body.results;

      List<Category> categories = results.map(
        (dynamic category) {
          return Category.fromMap(category);
        },
      ).toList();

      return categories;
    } else {
      throw "Unable to retrieve departments.";
    }
  }

  // Get One Category
  Future<Category> getOne({required String slug}) async {
    http.Response res = await http.get(
      Uri.parse(
        "${AppAPI.appBaseUrl}$_categoriesUrl$slug/",
        // "http://127.0.0.1:8000/api/departments/Exclusive%20Offer/",
      ),
    );
    if (res.statusCode == 200) {
      Category category = Category.fromJson(res.body);

      return category;
    } else {
      throw "Unable to retrieve departments.";
    }
  }
}
