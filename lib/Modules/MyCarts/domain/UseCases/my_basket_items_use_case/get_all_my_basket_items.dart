import 'package:nectar_mac/App/Exceptions/failure.dart';

import 'package:dartz/dartz.dart';

import '../../Entities/my_basket_item.dart';
import '../../Repository/base_my_basket_item_repository.dart';

class GetAllMyBasketItemsUsecase {
  final BaseMyBasketItemRepository myBasketItemRepository;

  GetAllMyBasketItemsUsecase(this.myBasketItemRepository);

  Future<Either<Failure, List<MyBasketItem>>> call() async {
    return await myBasketItemRepository.getAllMyBasketItems();
  }
}
