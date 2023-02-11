import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../Entities/product.dart';
import '../UseCases/get_product_search_usecase.dart';

abstract class BaseProductRepository {
  //
  Future<Either<Failure, List<Product>>> getAllProducts();
  //
  Future<Either<Failure, List<Product>>> getSearchProducts({
    required SearchProductsParameters searchProductsParameters,
  });
  //
}
