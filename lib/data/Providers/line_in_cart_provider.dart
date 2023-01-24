import 'package:http/http.dart' as http;
import 'package:nectar_mac/config/app_api.dart';

import '../Models/body.dart';
import '../Models/lines_in_card.dart';

class LineInCartApi {
  final String _cartsUrl = "/linesInCard";

  // Get All LineInCarts
  Future<List<LinesInCard?>> getAll() async {
    http.Response res = await http.get(
      Uri.parse(
        AppAPI.appBaseUrl + _cartsUrl,
      ),
    );

    if (res.statusCode == 200) {
      Body body = Body.fromJson(res.body);

      List<dynamic> results = body.results;

      List<LinesInCard> carts = results.map(
        (dynamic cart) {
          return LinesInCard.fromMap(cart);
        },
      ).toList();

      return carts;
    } else {
      throw "Unable to retrieve departments.";
    }
  }

  // Get One LineInCart
  Future<LinesInCard> getOne({required String slug}) async {
    http.Response res = await http.get(
      Uri.parse(
        "${AppAPI.appBaseUrl}/$_cartsUrl$slug/",
        // "http://127.0.0.1:8000/api/departments/Exclusive%20Offer/",
      ),
    );
    if (res.statusCode == 200) {
      LinesInCard cart = LinesInCard.fromJson(res.body);

      return cart;
    } else {
      throw "Unable to retrieve departments.";
    }
  }

  // Put One LineInCart
  Future<bool>? updateOne({
    String? url,
    int? amount,
  }) async {
    Map<String, String>? headers = {
      "Accept": "application/json",
    };
    try {
      http.Response res = await http.put(
        Uri.parse(url!),
        headers: headers,
        body: {"amount": amount},
      );
      return res.statusCode == 204;
    } catch (e) {
       return false;
    }
  }
}
