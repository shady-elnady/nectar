import 'package:http/http.dart' as http;
import 'package:nectar_mac/App/API/api_constance.dart';

import 'package:nectar_mac/App/API/error_message_model.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Models/body_model.dart';

import '../Models/brand_model.dart';

abstract class BaseBrandsRemoteDataSource {
  // Get All Brands
  Future<List<BrandModel>> getAllBrands();
  // Get OneBrand
  Future<BrandModel> getOneBrand({required String slug});
}

class BrandsRemoteDataSource implements BaseBrandsRemoteDataSource {
  final http.Client client;

  BrandsRemoteDataSource({required this.client});

  // Get All Brands Implementation
  @override
  Future<List<BrandModel>> getAllBrands() async {
    http.Response response = await client.get(
      Uri.parse(
        ApiConstance.brandsURL,
      ),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      BodyModel body = BodyModel.fromJson(response.body);

      List<dynamic> results = body.results;

      List<BrandModel> brands = results.map(
        (dynamic brand) {
          return BrandModel.fromMap(brand);
        },
      ).toList();

      return brands;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
            const {"ServerException": "ServerException"}),
      );
    }
  }

  // Get OneBrand
  @override
  Future<BrandModel> getOneBrand({required String slug}) async {
    http.Response res = await client.get(
      Uri.parse(
        "${ApiConstance.brandsURL}/$slug/",
      ),
    );
    if (res.statusCode == 200) {
      BrandModel brand = BrandModel.fromJson(res.body);

      return brand;
    } else {
      throw "Unable to retrieve Brands.";
    }
  }
}
