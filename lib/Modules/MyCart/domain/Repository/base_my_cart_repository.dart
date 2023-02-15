import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../Entities/my_cart.dart';

abstract class BaseMyCartRepository {
  Future<Either<Failure, List<MyCart>>> getAllFinishedMyCarts();
  Future<Either<Failure, MyCart>> getMyCart();
  Future<Either<Failure, Unit>> updateMyCart({
    required MyCart myCart,
  });
  Future<Either<Failure, Unit>> deleteMyCart({
    required String myCartURL,
  });
}
