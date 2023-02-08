import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../Entities/product.dart';

abstract class BaseProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
}
