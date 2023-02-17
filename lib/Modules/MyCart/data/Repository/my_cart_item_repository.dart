import 'package:dartz/dartz.dart';

import 'package:nectar_mac/App/Exceptions/exceptions.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Services/network_services.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';

import '../../domain/Entities/my_cart_item.dart';
import '../../domain/Repository/base_my_cart_item_repository.dart';
import '../DataSource/my_cart_items_local_data_source.dart';
import '../DataSource/my_cart_items_remote_data_source.dart';
import '../Models/my_cart_item_model.dart';

class MyCartItemRepository extends BaseMyCartItemRepository {
  final BaseMyCartItemRemoteDataSource remoteMyCartItemDataSource;
  final MyCartItemLocalDataSource localMyCartItemDataSource;
  final NetworkService networkService;

  MyCartItemRepository({
    required this.remoteMyCartItemDataSource,
    required this.localMyCartItemDataSource,
    required this.networkService,
  });

  @override
  Future<Either<Failure, List<MyCartItemModel>>> getAllMyCartItems() async {
    if (await networkService.isConnected) {
      try {
        List<MyCartItemModel> remoteMyCartItems =
            await remoteMyCartItemDataSource.getAllMyCartItems();
        localMyCartItemDataSource.cacheMyCartItems(
            myCartItemsList: remoteMyCartItems);
        return Right(remoteMyCartItems);
      } on ServerException catch (failure) {
        return Left(
          ServerFailure(
            message: failure.errorMessageModel.statusMessage,
          ),
        );
      }
    } else {
      try {
        List<MyCartItemModel> localMyCartItems =
            await localMyCartItemDataSource.getCachedMyCartItems();
        return Right(localMyCartItems);
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
  Future<Either<Failure, Unit>> addMyCartItem(
      {required MyCartItem myCartItem}) {
    // TODO: implement addMyCartItem
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteMyCartItem({
    required String myCartItemURL,
  }) {
    // TODO: implement deleteMyCartItem
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateMyCartItem(
      {required MyCartItem myCartItem}) {
    // TODO: implement updateMyCartItem
    throw UnimplementedError();
  }
}
