import 'package:dartz/dartz.dart';

import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Services/network_services.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';
import 'package:nectar_mac/Modules/Cart/domain/Entities/my_basket.dart';

import '../../domain/Repository/base_my_basket_repository.dart';
import '../DataSource/my_basket_local_data_source.dart';
import '../DataSource/my_basket_remote_data_source.dart';
import '../Models/my_basket_model.dart';

class MyBasketRepository extends BaseMyBasketRepository {
  final BaseMyBasketRemoteDataSource remoteMyBasketDataSource;
  final MyBasketLocalDataSource localMyBasketDataSource;
  final NetworkService networkService;

  MyBasketRepository({
    required this.remoteMyBasketDataSource,
    required this.localMyBasketDataSource,
    required this.networkService,
  });

  @override
  Future<Either<Failure, MyBasketModel>> getMyBasket() async {
    if (await networkService.isConnected) {
      try {
        MyBasketModel remoteMyBaskets =
            await remoteMyBasketDataSource.getMyBasket();
        localMyBasketDataSource.cacheMyBasket(myBasket: remoteMyBaskets);
        return Right(remoteMyBaskets);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.errorMessageModel.statusMessage));
      }
    } else {
      try {
        MyBasketModel localMyBaskets =
            await localMyBasketDataSource.getCachedMyBasket();
        return Right(localMyBaskets);
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
  Future<Either<Failure, Unit>> deleteMyBasket() {
    // TODO: implement deleteMyBasket
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateMyBasket({required MyBasket myBasket}) {
    // TODO: implement updateMyBasket
    throw UnimplementedError();
  }
}
