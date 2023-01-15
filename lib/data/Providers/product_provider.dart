import 'package:http/http.dart' as http;
import 'package:nectar_mac/config/app_api.dart';

import '../Models/body.dart';
import '../Models/product.dart';

class ProductApi {
  final String _productsUrl = "/api/products/";

  // Get All products
  Future<List<Product>> getAll() async {
    http.Response res = await http.get(
      Uri.parse(
        AppAPI.appBaseUrl + _productsUrl,
      ),
    );

    if (res.statusCode == 200) {
      Body body = Body.fromJson(res.body);

      List<dynamic> results = body.results;

      List<Product> products = results.map(
        (dynamic product) {
          return Product.fromMap(product);
        },
      ).toList();

      return products;
    } else {
      throw "Unable to retrieve departments.";
    }
  }

  // Get One Name
  Future<List<Product>> getOneByName({String? name}) async {
    http.Response res = await http.get(
      Uri.parse(
        "${AppAPI.appBaseUrl}$_productsUrl?name=$name",
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 200) {
      Body body = Body.fromJson(res.body);

      List<dynamic> results = body.results;

      List<Product> products = results.map(
        (dynamic product) {
          return Product.fromMap(product);
        },
      ).toList();

      return products;
    } else {
      throw "Unable to retrieve departments.";
    }
  }

  // Get One product by Slug
  Future<Product> getOneBySlug({required String slug}) async {
    http.Response res = await http.get(
      Uri.parse(
        "${AppAPI.appBaseUrl}$_productsUrl$slug/",
        // "http://127.0.0.1:8000/api/departments/Exclusive%20Offer/",
      ),
    );
    if (res.statusCode == 200) {
      Product product = Product.fromJson(res.body);

      return product;
    } else {
      throw "Unable to retrieve products.";
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
