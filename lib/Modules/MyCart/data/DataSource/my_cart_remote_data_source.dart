import 'package:http/http.dart' as http;
import 'package:nectar_mac/App/API/api_constance.dart';

import 'package:nectar_mac/App/API/error_message_model.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Models/body_model.dart';

import '../Models/my_cart_model.dart';

abstract class BaseMyCartRemoteDataSource {
  // Get MCarty
  Future<MyCartModel> getMyCart();
}

class MyCartRemoteDataSource implements BaseMyCartRemoteDataSource {
  final http.Client client;

  MyCartRemoteDataSource({
    required this.client,
  });

  // Get  MyCart Implementation
  @override
  Future<MyCartModel> getMyCart() async {
    http.Response response = await client.get(
      Uri.parse(
        ApiConstance.myCartsURL,
      ),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      BodyModel body = BodyModel.fromJson(response.body);

      List<dynamic> results = body.results;

      List<MyCartModel> myCarts = results.map(
        (dynamic myBsketMap) {
          return MyCartModel.fromMap(myBsketMap);
        },
      ).toList();

      return myCarts.first;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
            const {"ServerException": "ServerException"}),
      );
    }
  }
}
