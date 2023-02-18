import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../Entities/product.dart';
import '../../Repository/base_favorite_product_repository.dart';

class AddFavoriteProductUsecase {
  final BaseFavoriteProductRepository favoriteProductRepository;
  AddFavoriteProductUsecase({
    required this.favoriteProductRepository,
  });

  Future<Either<Failure, Unit>> call({
    required Product product,
  }) async {
    return await favoriteProductRepository.addFavoriteProduct(
      product: product,
    );
  }
}
