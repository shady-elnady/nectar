import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../Repository/base_favorite_product_repository.dart';

class DeleteFavoriteProductUsecase {
  final BaseFavoriteProductRepository favoriteProductRepository;
  DeleteFavoriteProductUsecase(this.favoriteProductRepository);

  Future<Either<Failure, Unit>> call({
    required String favoriteProductURL,
  }) async {
    return await favoriteProductRepository.deleteFavoriteProduct(
      favoriteProductURL: favoriteProductURL,
    );
  }
}
