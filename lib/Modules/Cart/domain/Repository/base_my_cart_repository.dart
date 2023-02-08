import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../Entities/my_cart.dart';

abstract class BaseMyCartRepository {
  Future<Either<Failure, List<MyCart>>> getAllMyCarts();
}
