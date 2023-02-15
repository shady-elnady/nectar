import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../Entities/my_cart_item.dart';

abstract class BaseMyCartItemRepository {
  Future<Either<Failure, List<MyCartItem>>> getAllMyCartItems();
  Future<Either<Failure, Unit>> deleteMyCartItem({
    required String myCartItemURL,
  });
  Future<Either<Failure, Unit>> updateMyCartItem({
    required MyCartItem myCartItem,
  });
  Future<Either<Failure, Unit>> addMyCartItem({
    required MyCartItem myCartItem,
  });
}
