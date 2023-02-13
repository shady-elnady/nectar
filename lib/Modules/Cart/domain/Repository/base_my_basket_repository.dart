import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../../Product/domain/Entities/product.dart';
import '../Entities/my_basket.dart';
import '../Entities/my_basket_item.dart';

abstract class BaseMyBasketRepository {
  Future<Either<Failure, MyBasket>> getMyBasket();
  Future<Either<Failure, Unit>> deleteMyBasketItem({
    required Product product,
  });
  Future<Either<Failure, Unit>> updateMyBasketItem({
    required MyBasketItem myBasketItem,
  });
  Future<Either<Failure, Unit>> addMyBasketItem({
    required MyBasketItem myBasketItem,
  });
}
