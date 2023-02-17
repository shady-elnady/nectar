import 'package:dartz/dartz.dart';

import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Services/network_services.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';

import '../../domain/Entities/brand.dart';
import '../../domain/Repository/base_brands_repository.dart';
import '../DataSource/brands_local_data_source.dart';
import '../DataSource/brands_remote_data_source.dart';
import '../Models/brand_model.dart';

class BrandsRepository extends BaseBrandsRepository {
  final BaseBrandsRemoteDataSource remoteBrandsDataSource;
  final BrandsLocalDataSource localBrandsDataSource;
  final NetworkService networkService;

  BrandsRepository({
    required this.remoteBrandsDataSource,
    required this.localBrandsDataSource,
    required this.networkService,
  });

  @override
  Future<Either<Failure, List<Brand>>> getAllBrands() async {
    if (await networkService.isConnected) {
      try {
        List<BrandModel> remoteBrands =
            await remoteBrandsDataSource.getAllBrands();
        localBrandsDataSource.cacheBrands(remoteBrands);
        return Right(remoteBrands);
      } on ServerException catch (failure) {
        return Left(
          ServerFailure(
            message: failure.errorMessageModel.statusMessage,
          ),
        );
      }
    } else {
      try {
        List<BrandModel> localBrands =
            await localBrandsDataSource.getCachedBrands();
        return Right(localBrands);
      } on EmptyCacheException {
        return const Left(
          EmptyCacheFailure(
            message: Meassages.emptyCacheData,
          ),
        );
      }
    }
  }
}
