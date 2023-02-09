import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../Entities/product.dart';
import '../UseCases/product_search_by_name_usecase.dart';

abstract class BaseProductRepository {
  //
  Future<Either<Failure, List<Product>>> getAllProducts();
  //
  Future<Either<Failure, List<Product>>> searchProductsByName({
    required SearchProductsByNameParameters searchProductsParameters,
  });
  //
}
