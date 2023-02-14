import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../Entities/my_basket.dart';

abstract class BaseMyBasketRepository {
  Future<Either<Failure, MyBasket>> getMyBasket();
  Future<Either<Failure, Unit>> updateMyBasket({
    required MyBasket myBasket,
  });
  Future<Either<Failure, Unit>> deleteMyBasket();
}
