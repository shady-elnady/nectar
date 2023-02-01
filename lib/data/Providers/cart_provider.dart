import 'package:http/http.dart' as http;
import 'package:nectar_mac/config/app_api.dart';

import '../Models/body.dart';
import '../../Modules/Cart/data/Models/cart_model.dart';

class CartApi {
  final String _cartsUrl = "/cards";

  // Get All Carts
  Future<List<Cart?>> getAll() async {
    http.Response res = await http.get(
      Uri.parse(
        AppAPI.appBaseUrl + _cartsUrl,
      ),
    );

    if (res.statusCode == 200) {
      Body body = Body.fromJson(res.body);

      List<dynamic> results = body.results;

      List<Cart> carts = results.map(
        (dynamic cart) {
          return Cart.fromMap(cart);
        },
      ).toList();

      return carts;
    } else {
      throw "Unable to retrieve departments.";
    }
  }

  // Get Not Finished Cart
  Future<List<Cart?>> getMyCart() async {
    // bool isFinished = false;
    http.Response res = await http.get(
      Uri.parse("${AppAPI.appBaseUrl}$_cartsUrl?is_finished=False"),
    );

    if (res.statusCode == 200) {
      Body body = Body.fromJson(res.body);

      List<dynamic> results = body.results;

      List<Cart> carts = results.map(
        (dynamic cart) {
          return Cart.fromMap(cart);
        },
      ).toList();

      return carts;
    } else {
      throw "Unable to retrieve departments.";
    }
  }

  // Get One Carts
  Future<Cart> getOne({required String slug}) async {
    http.Response res = await http.get(
      Uri.parse(
        "${AppAPI.appBaseUrl}$_cartsUrl$slug/",
        // "http://127.0.0.1:8000/api/departments/Exclusive%20Offer/",
      ),
    );
    if (res.statusCode == 200) {
      Cart cart = Cart.fromJson(res.body);

      return cart;
    } else {
      throw "Unable to retrieve departments.";
    }
  }
}
