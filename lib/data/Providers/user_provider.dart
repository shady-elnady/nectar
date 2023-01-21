import 'package:http/http.dart' as http;
import 'package:nectar_mac/config/app_api.dart';

import '../Models/User.dart';
import '../Models/body.dart';
import '../Models/product.dart';

class UserApi {
  final String _usersUrl = "/users";

  // Get one User
  Future<User> getUser({
    String userName = "shady",
  }) async {
    http.Response res = await http.get(
      Uri.parse(
        "${AppAPI.appBaseUrl}$_usersUrl?username=$userName",
      ),
    );

    if (res.statusCode == 200) {
      Body body = Body.fromJson(res.body);

      List<dynamic> results = body.results;

      List<User> users = results.map(
        (dynamic user) {
          return User.fromMap(user);
        },
      ).toList();

      return users[0];
    } else {
      throw "Unable to retrieve departments.";
    }
  }

  // Get User Favorite Products
  Future<List<Product>> getUserFavoriteProducts({
    String userName = "shady",
  }) async {
    http.Response res = await http.get(
      Uri.parse(
        "${AppAPI.appBaseUrl}$_usersUrl?username=$userName",
      ),
    );

    if (res.statusCode == 200) {
      Body body = Body.fromJson(res.body);

      List<dynamic> results = body.results;

      List<User> users = results.map(
        (dynamic user) {
          return User.fromMap(user);
        },
      ).toList();

      return users[0].favoritesProducts;
    } else {
      throw "Unable to retrieve departments.";
    }
  }

  // Get One product by Slug
  Future<User> getOneBySlug({required String slug}) async {
    http.Response res = await http.get(
      Uri.parse(
        "${AppAPI.appBaseUrl}$_usersUrl$slug/",
        // "http://127.0.0.1:8000/api/departments/Exclusive%20Offer/",
      ),
    );
    if (res.statusCode == 200) {
      User user = User.fromJson(res.body);

      return user;
    } else {
      throw "Unable to retrieve products.";
    }
  }
}
