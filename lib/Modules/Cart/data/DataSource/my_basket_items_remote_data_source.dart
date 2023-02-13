import 'package:http/http.dart' as http;
import 'package:nectar_mac/App/API/api_constance.dart';

import 'package:nectar_mac/App/API/error_message_model.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Models/body_model.dart';

import '../Models/my_basket_item_model.dart';

abstract class BaseMyBasketItemRemoteDataSource {
  // Get All MyBasketItems
  Future<List<MyBasketItemModel>> getAllMyBasketItems();
  // Get OnMyBasketIteme
  Future<MyBasketItemModel> getOneMyBasketItem({
    required String slug,
  });
}

class MyBasketItemRemoteDataSource implements BaseMyBasketItemRemoteDataSource {
  final http.Client client;

  MyBasketItemRemoteDataSource({
    required this.client,
  });

  // Get All MyBasketItems Implementation
  @override
  Future<List<MyBasketItemModel>> getAllMyBasketItems() async {
    http.Response response = await client.get(
      Uri.parse(
        ApiConstance.myBasketItemsURL,
      ),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      BodyModel body = BodyModel.fromJson(response.body);

      List<MyBasketItemModel> myBasketItems = body.results.map(
        (dynamic myBasketItem) {
          return MyBasketItemModel.fromMap(myBasketItem);
        },
      ).toList();

      return myBasketItems;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
          const {"ServerException": "ServerException"},
        ),
      );
    }
  }

  // Get OneMyBasketItem
  @override
  Future<MyBasketItemModel> getOneMyBasketItem({
    required String slug,
  }) async {
    http.Response res = await client.get(
      Uri.parse(
        "${ApiConstance.myBasketItemsURL}/$slug/",
      ),
    );
    if (res.statusCode == 200) {
      return MyBasketItemModel.fromJson(res.body);
    } else {
      throw "Unable to retrieve MyBasketItems.";
    }
  }
}
