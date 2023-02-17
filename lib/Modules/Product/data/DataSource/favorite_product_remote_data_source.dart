import 'package:http/http.dart' as http;
import 'package:nectar_mac/App/API/api_constance.dart';

import 'package:nectar_mac/App/API/error_message_model.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Models/body_model.dart';

import '../Models/favorite_product_model.dart';

abstract class BaseFavoriteProductRemoteDataSource {
  // Get All FavoriteProducts
  Future<List<FavoriteProductModel>> getAllFavoriteProducts();
  // Get OnFavoriteProducte
  Future<FavoriteProductModel> getOneFavoriteProduct({
    required String slug,
  });
}

class FavoriteProductRemoteDataSource
    implements BaseFavoriteProductRemoteDataSource {
  final http.Client client;

  FavoriteProductRemoteDataSource({
    required this.client,
  });

  // Get All FavoriteProducts Implementation
  @override
  Future<List<FavoriteProductModel>> getAllFavoriteProducts() async {
    http.Response response = await client.get(
      Uri.parse(
        ApiConstance.favoriteProductsURL,
      ),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      BodyModel body = BodyModel.fromJson(response.body);

      List<FavoriteProductModel> favoriteProducts = body.results.map(
        (dynamic favoriteProduct) {
          return FavoriteProductModel.fromMap(favoriteProduct);
        },
      ).toList();

      return favoriteProducts;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          const {"ServerException": "ServerException"},
        ),
      );
    }
  }

  // Get OnFavoriteProducte
  @override
  Future<FavoriteProductModel> getOneFavoriteProduct({
    required String slug,
  }) async {
    http.Response res = await client.get(
      Uri.parse(
        "${ApiConstance.favoriteProductsURL}/$slug/",
      ),
    );
    if (res.statusCode == 200) {
      return FavoriteProductModel.fromJson(res.body);
    } else {
      throw "Unable to retrieve FavoriteProducts.";
    }
  }
}
