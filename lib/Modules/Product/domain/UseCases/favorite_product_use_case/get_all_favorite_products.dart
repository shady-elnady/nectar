import 'package:nectar_mac/App/Exceptions/failure.dart';

import 'package:dartz/dartz.dart';

import '../../Entities/favorite_product.dart';
import '../../Repository/base_favorite_product_repository.dart';

class GetAllFavoriteProductsUsecase {
  final BaseFavoriteProductRepository favoriteProductRepository;

  GetAllFavoriteProductsUsecase({
    required this.favoriteProductRepository,
  });

  Future<Either<Failure, List<FavoriteProduct>>> call() {
    return favoriteProductRepository.getAllFavoriteProducts();
  }
}
