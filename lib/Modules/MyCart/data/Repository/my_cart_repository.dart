import 'package:dartz/dartz.dart';

import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Services/network_services.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';

import '../../domain/Entities/my_cart.dart';
import '../../domain/Repository/base_my_cart_repository.dart';
import '../DataSource/my_cart_local_data_source.dart';
import '../DataSource/my_cart_remote_data_source.dart';
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
  Future<Either<Failure, MyCartModel>> getMyCart() async {
    if (await networkService.isConnected) {
      try {
        MyCartModel remoteMyCarts = await remoteMyCartDataSource.getMyCart();
        localMyCartDataSource.cacheMyCart(myCart: remoteMyCarts);
        return Right(remoteMyCarts);
      } on ServerException catch (failure) {
        return Left(
          ServerFailure(
            message: failure.errorMessageModel.statusMessage,
          ),
        );
      }
    } else {
      try {
        MyCartModel localMyCarts =
            await localMyCartDataSource.getCachedMyCart();
        return Right(localMyCarts);
      } on EmptyCacheException {
        return const Left(
          EmptyCacheFailure(
            message: Meassages.emptyCacheData,
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteMyCart({
    required String myCartURL,
  }) {
    // TODO: implement deleteMCarty
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateMyCart({
    required MyCart myCart,
  }) {
    // TODO: implement updateMCarty
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MyCart>>> getAllFinishedMyCarts() {
    // TODO: implement getAllFinishedMyCarts
    throw UnimplementedError();
  }
}
