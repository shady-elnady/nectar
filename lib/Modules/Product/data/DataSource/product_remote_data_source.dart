import 'package:http/http.dart' as http;
import 'package:nectar_mac/App/API/api_constance.dart';

import 'package:nectar_mac/App/API/error_message_model.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Models/body_model.dart';

import '../Models/product_model.dart';

abstract class BaseProductRemoteDataSource {
  // Get All Products
  Future<List<ProductModel>> getAllProducts();
  // Get One Product
  Future<ProductModel> getOneProduct({required String slug});
}

class ProductRemoteDataSource implements BaseProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSource({required this.client});

  // Get All Products Implementation
  @override
  Future<List<ProductModel>> getAllProducts() async {
    http.Response response = await client.get(
      Uri.parse(
        ApiConstance.productsURL,
      ),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      BodyModel body = BodyModel.fromJson(response.body);

      List<dynamic> results = body.results;

      List<ProductModel> products = results.map(
        (dynamic product) {
          return ProductModel.fromMap(product);
        },
      ).toList();

      return products;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
            const {"ServerException": "ServerException"}),
      );
    }
  }

  // Get One Product
  @override
  Future<ProductModel> getOneProduct({required String slug}) async {
    http.Response res = await client.get(
      Uri.parse(
        "${ApiConstance.productsURL}/$slug/",
      ),
    );
    if (res.statusCode == 200) {
      ProductModel product = ProductModel.fromJson(res.body);

      return product;
    } else {
      throw "Unable to retrieve Products.";
    }
  }
}
