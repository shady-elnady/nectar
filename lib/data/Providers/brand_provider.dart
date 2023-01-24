import 'package:http/http.dart' as http;
import 'package:nectar_mac/config/app_api.dart';

import '../Models/body.dart';
import '../Models/brand.dart';

class BrandApi {
  final String _brandsUrl = "/brands/";

  // Get All Categories
  Future<List<Brand>> getAll() async {
    http.Response res = await http.get(
      Uri.parse(
        AppAPI.appBaseUrl + _brandsUrl,
      ),
    );

    if (res.statusCode == 200) {
      Body body = Body.fromJson(res.body);

      List<dynamic> results = body.results;

      List<Brand> brands = results.map(
        (dynamic brand) {
          return Brand.fromMap(brand);
        },
      ).toList();

      return brands;
    } else {
      throw "Unable to retrieve departments.";
    }
  }

  // Get One Category
  Future<Brand> getOne({required String slug}) async {
    http.Response res = await http.get(
      Uri.parse(
        "${AppAPI.appBaseUrl}$_brandsUrl$slug/",
        // "http://127.0.0.1:8000/api/departments/Exclusive%20Offer/",
      ),
    );
    if (res.statusCode == 200) {
      Brand brand = Brand.fromJson(res.body);

      return brand;
    } else {
      throw "Unable to retrieve departments.";
    }
  }
}
