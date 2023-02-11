import 'package:dartz/dartz.dart';

import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Services/network_services.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';
import 'package:nectar_mac/Modules/Product/domain/UseCases/get_product_search_usecase.dart';
import 'package:nectar_mac/Modules/Product/domain/Entities/product.dart';

import '../../domain/Repository/base_product_repository.dart';
import '../DataSource/Product_local_data_source.dart';
import '../DataSource/product_remote_data_source.dart';
import '../Models/product_model.dart';

class ProductRepository extends BaseProductRepository {
  final BaseProductRemoteDataSource remoteProductDataSource;
  final ProductLocalDataSource localProductDataSource;
  final NetworkService networkService;

  ProductRepository({
    required this.remoteProductDataSource,
    required this.localProductDataSource,
    required this.networkService,
  });

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    if (await networkService.isConnected) {
      try {
        List<ProductModel> remoteProducts =
            await remoteProductDataSource.getAllProducts();
        localProductDataSource.cacheProducts(remoteProducts);
        return Right(remoteProducts);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.errorMessageModel.statusMessage));
      }
    } else {
      try {
        List<ProductModel> localProducts =
            await localProductDataSource.getCachedProducts();
        return Right(localProducts);
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
  Future<Either<Failure, List<Product>>> getSearchProducts({
    required SearchProductsParameters searchProductsParameters,
  }) async {
    if (await networkService.isConnected) {
      try {
        List<ProductModel> remoteSearchProducts = await remoteProductDataSource
            .searchProducts(searchProductsParameters: searchProductsParameters);
        return Right(remoteSearchProducts);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.errorMessageModel.statusMessage));
      }
    } else {
      try {
        List<ProductModel> localSearchProducts =
            await localProductDataSource.getCachedSearchedProducts(
                searchProductsParameters: searchProductsParameters);
        return Right(localSearchProducts);
      } on EmptyCacheException {
        return const Left(
          EmptyCacheFailure(
            Meassages.emptyCacheData,
          ),
        );
      }
    }
  }
}
