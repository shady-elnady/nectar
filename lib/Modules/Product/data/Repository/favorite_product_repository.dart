import 'package:dartz/dartz.dart';

import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Services/network_services.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';

import '../../domain/Repository/base_favorite_product_repository.dart';
import '../DataSource/favorite_product_local_data_source.dart';
import '../DataSource/favorite_product_remote_data_source.dart';
import '../Models/favorite_product_model.dart';

class FavoriteProductRepository extends BaseFavoriteProductRepository {
  final BaseFavoriteProductRemoteDataSource remoteFavoriteProductDataSource;
  final FavoriteProductLocalDataSource localFavoriteProductDataSource;
  final NetworkService networkService;

  FavoriteProductRepository({
    required this.remoteFavoriteProductDataSource,
    required this.localFavoriteProductDataSource,
    required this.networkService,
  });

  @override
  Future<Either<Failure, List<FavoriteProductModel>>>
      getAllFavoriteProducts() async {
    if (await networkService.isConnected) {
      try {
        List<FavoriteProductModel> remoteFavoriteProducts =
            await remoteFavoriteProductDataSource.getAllFavoriteProducts();
        localFavoriteProductDataSource.cacheFavoriteProducts(
            favoriteProductsList: remoteFavoriteProducts);
        return Right(remoteFavoriteProducts);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.errorMessageModel.statusMessage));
      }
    } else {
      try {
        List<FavoriteProductModel> localFavoriteProducts =
            await localFavoriteProductDataSource.getCachedFavoriteProducts();
        return Right(localFavoriteProducts);
      } on EmptyCacheException {
        return const Left(
          EmptyCacheFailure(
            Meassages.emptyCacheData,
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addFavoriteProduct({
    required String productURL,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteFavoriteProduct({
    required String productURL,
  }) {
    // TODO: implement deletFavoriteProducte
    throw UnimplementedError();
  }
}
