import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../Entities/favorite_product.dart';
import '../Entities/product.dart';

abstract class BaseFavoriteProductRepository {
  //
  Future<Either<Failure, List<FavoriteProduct>>> getAllFavoriteProducts();
  //
  Future<Either<Failure, Unit>> deleteFavoriteProduct({
    required String favoriteProductURL,
  });
  Future<Either<Failure, Unit>> addFavoriteProduct({
    required Product product,
  });
}
