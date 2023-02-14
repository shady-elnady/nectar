import 'package:dartz/dartz.dart';

import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Services/network_services.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';
import 'package:nectar_mac/Modules/Product/domain/Entities/product.dart';
import 'package:nectar_mac/Modules/MyBasket/domain/Entities/my_basket_item.dart';

import '../../domain/Repository/base_my_basket_item_repository.dart';
import '../DataSource/my_Basket_items_local_data_source.dart';
import '../DataSource/my_basket_items_remote_data_source.dart';
import '../Models/my_basket_item_model.dart';

class MyBasketItemRepository extends BaseMyBasketItemRepository {
  final BaseMyBasketItemRemoteDataSource remoteMyBasketItemDataSource;
  final MyBasketItemLocalDataSource localMyBasketItemDataSource;
  final NetworkService networkService;

  MyBasketItemRepository({
    required this.remoteMyBasketItemDataSource,
    required this.localMyBasketItemDataSource,
    required this.networkService,
  });

  @override
  Future<Either<Failure, List<MyBasketItemModel>>> getAllMyBasketItems() async {
    if (await networkService.isConnected) {
      try {
        List<MyBasketItemModel> remoteMyBasketItems =
            await remoteMyBasketItemDataSource.getAllMyBasketItems();
        localMyBasketItemDataSource.cacheMyBasketItems(
            myBasketItemsList: remoteMyBasketItems);
        return Right(remoteMyBasketItems);
      } on ServerException catch (failure) {
        return Left(ServerFailure(failure.errorMessageModel.statusMessage));
      }
    } else {
      try {
        List<MyBasketItemModel> localMyBasketItems =
            await localMyBasketItemDataSource.getCachedMyBasketItems();
        return Right(localMyBasketItems);
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
  Future<Either<Failure, Unit>> addMyBasketItem(
      {required MyBasketItem myBasketItem}) {
    // TODO: implement addMyBasketItem
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteMyBasketItem({required Product product}) {
    // TODO: implement deleteMyBasketItem
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateMyBasketItem(
      {required MyBasketItem myBasketItem}) {
    // TODO: implement updateMyBasketItem
    throw UnimplementedError();
  }
}
