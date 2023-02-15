import 'package:http/http.dart' as http;
import 'package:nectar_mac/App/API/api_constance.dart';

import 'package:nectar_mac/App/API/error_message_model.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Models/body_model.dart';

import '../Models/my_cart_item_model.dart';

abstract class BaseMyCartItemRemoteDataSource {
  // Get All MyCartItems
  Future<List<MyCartItemModel>> getAllMyCartItems();
  // Get OnMyCartIteme
  Future<MyCartItemModel> getOneMyCartItem({
    required String slug,
  });
}

class MyCartItemRemoteDataSource implements BaseMyCartItemRemoteDataSource {
  final http.Client client;

  MyCartItemRemoteDataSource({
    required this.client,
  });

  // Get All MyCartItems Implementation
  @override
  Future<List<MyCartItemModel>> getAllMyCartItems() async {
    http.Response response = await client.get(
      Uri.parse(
        ApiConstance.myCartItemsURL,
      ),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      BodyModel body = BodyModel.fromJson(response.body);

      List<MyCartItemModel> myCartItems = body.results.map(
        (dynamic myCartItem) {
          return MyCartItemModel.fromMap(myCartItem);
        },
      ).toList();

      return myCartItems;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          const {"ServerException": "ServerException"},
        ),
      );
    }
  }

  // Get OneMyCartItem
  @override
  Future<MyCartItemModel> getOneMyCartItem({
    required String slug,
  }) async {
    http.Response res = await client.get(
      Uri.parse(
        "${ApiConstance.myCartItemsURL}/$slug/",
      ),
    );
    if (res.statusCode == 200) {
      return MyCartItemModel.fromJson(res.body);
    } else {
      throw "Unable to retrieve MyCartItems.";
    }
  }
}
