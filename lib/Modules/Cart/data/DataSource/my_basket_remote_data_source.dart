import 'package:http/http.dart' as http;
import 'package:nectar_mac/App/API/api_constance.dart';

import 'package:nectar_mac/App/API/error_message_model.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Models/body_model.dart';

import '../Models/my_basket_model.dart';

abstract class BaseMyBasketRemoteDataSource {
  // Get MyBasket
  Future<MyBasketModel> getMyBasket();
}

class MyBasketRemoteDataSource implements BaseMyBasketRemoteDataSource {
  final http.Client client;

  MyBasketRemoteDataSource({
    required this.client,
  });

  // Get  MyBasket Implementation
  @override
  Future<MyBasketModel> getMyBasket() async {
    http.Response response = await client.get(
      Uri.parse(
        ApiConstance.myBasketsURL,
      ),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      BodyModel body = BodyModel.fromJson(response.body);

      List<dynamic> results = body.results;

      List<MyBasketModel> myBaskets = results.map(
        (dynamic myBsketMap) {
          return MyBasketModel.fromMap(myBsketMap);
        },
      ).toList();

      return myBaskets.first;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
            const {"ServerException": "ServerException"}),
      );
    }
  }
}
