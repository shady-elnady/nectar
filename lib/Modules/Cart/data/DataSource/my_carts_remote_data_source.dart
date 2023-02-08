import 'package:http/http.dart' as http;
import 'package:nectar_mac/App/API/api_constance.dart';

import 'package:nectar_mac/App/API/error_message_model.dart';
import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Models/body_model.dart';

import '../Models/my_cart_model.dart';

abstract class BaseMyCartRemoteDataSource {
  // Get All MyCarts
  Future<List<MyCartModel>> getAllMyCarts();
  // Get OneMyCart
  Future<MyCartModel> getOneMyCart({required String slug});
}

class MyCartRemoteDataSource implements BaseMyCartRemoteDataSource {
  final http.Client client;

  MyCartRemoteDataSource({required this.client});

  // Get All MyCarts Implementation
  @override
  Future<List<MyCartModel>> getAllMyCarts() async {
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
        (dynamic myCart) {
          return MyCartModel.fromMap(myCart);
        },
      ).toList();

      return myCarts;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(
            const {"ServerException": "ServerException"}),
      );
    }
  }

  // Get One MyCart
  @override
  Future<MyCartModel> getOneMyCart({required String slug}) async {
    http.Response res = await client.get(
      Uri.parse(
        "${ApiConstance.myCartsURL}/$slug/",
      ),
    );
    if (res.statusCode == 200) {
      MyCartModel myCart = MyCartModel.fromJson(res.body);

      return myCart;
    } else {
      throw "Unable to retrieve MyCarts.";
    }
  }
}
