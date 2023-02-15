import 'package:nectar_mac/App/Exceptions/failure.dart';

import 'package:dartz/dartz.dart';

import '../../Entities/my_cart_item.dart';
import '../../Repository/base_my_cart_item_repository.dart';

class GetAllMyCartItemsUsecase {
  final BaseMyCartItemRepository myCartItemRepository;

  GetAllMyCartItemsUsecase(this.myCartItemRepository);

  Future<Either<Failure, List<MyCartItem>>> call() {
    return myCartItemRepository.getAllMyCartItems();
  }
}
