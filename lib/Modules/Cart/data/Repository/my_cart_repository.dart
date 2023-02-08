import 'package:dartz/dartz.dart';

import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Services/network_services.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';

import '../../domain/Repository/base_my_cart_repository.dart';
import '../DataSource/my_carts_local_data_source.dart';
import '../DataSource/my_carts_remote_data_source.dart';
import '../Models/my_cart_model.dart';

class MyCartRepository extends BaseMyCartRepository {
  final BaseMyCartRemoteDataSource remoteMyCartDataSource;
  final MyCartLocalDataSource localMyCartDataSource;
  final NetworkService networkService;

  MyCartRepository({
    required this.remoteMyCartDataSource,
    required this.localMyCartDataSource,
    required this.networkService,
  });

  @override
  Future<Either<Failure, List<MyCartModel>>> getAllMyCarts() async {
    if (await networkService.isConnected) {
      try {
        List<MyCartModel> remoteMyCarts =
            await remoteMyCartDataSource.getAllMyCarts();
        localMyCartDataSource.cacheMyCarts(remoteMyCarts);
        return Right(remoteMyCarts);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.errorMessageModel.statusMessage));
      }
    } else {
      try {
        List<MyCartModel> localMyCarts =
            await localMyCartDataSource.getCachedMyCarts();
        return Right(localMyCarts);
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
