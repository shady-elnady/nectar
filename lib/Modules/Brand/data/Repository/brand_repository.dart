import 'package:dartz/dartz.dart';

import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Services/network_services.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';
import 'package:nectar_mac/Modules/Brand/data/Models/Brand_model.dart';

import '../../domain/Repository/base_Brand_repository.dart';
import '../DataSource/brand_local_data_source.dart';
import '../DataSource/brand_remote_data_source.dart';

class BrandRepository extends BaseBrandRepository {
  final BaseBrandRemoteDataSource remoteBrandDataSource;
  final BrandLocalDataSource localBrandDataSource;
  final NetworkService networkService;

  BrandRepository({
    required this.remoteBrandDataSource,
    required this.localBrandDataSource,
    required this.networkService,
  });

  @override
  Future<Either<Failure, List<BrandModel>>> getAllBrands() async {
    if (await networkService.isConnected) {
      try {
        List<BrandModel> remoteBrands =
            await remoteBrandDataSource.getAllBrands();
        localBrandDataSource.cacheBrands(remoteBrands);
        return Right(remoteBrands);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.errorMessageModel.statusMessage));
      }
    } else {
      try {
        List<BrandModel> localBrands =
            await localBrandDataSource.getCachedBrands();
        return Right(localBrands);
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
