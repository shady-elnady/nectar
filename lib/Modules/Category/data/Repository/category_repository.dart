import 'package:dartz/dartz.dart';

import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Services/network_services.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';

import '../../domain/Entities/category.dart';
import '../../domain/Repository/base_category_repository.dart';
import '../DataSource/category_local_data_source.dart';
import '../DataSource/category_remote_data_source.dart';

class CategoriesRepository extends BaseCategoryRepository {
  final BaseCategoryRemoteDataSource remoteCategoriesDataSource;
  final CategoriesLocalDataSourceImpl localCategoriesDataSource;
  final NetworkService networkService;

  CategoriesRepository({
    required this.remoteCategoriesDataSource,
    required this.localCategoriesDataSource,
    required this.networkService,
  });

  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
    if (await networkService.isConnected) {
      try {
        List<Category> remoteCategories =
            await remoteCategoriesDataSource.getAllCategories();
        localCategoriesDataSource.cacheCategories(remoteCategories);
        return Right(remoteCategories);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.errorMessageModel.statusMessage));
      }
    } else {
      try {
        List<Category> localDepartments =
            await localCategoriesDataSource.getCachedCategories();
        return Right(localDepartments);
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
