import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../Entities/my_basket_item.dart';
import '../../Repository/base_my_basket_item_repository.dart';

class UpdateMyBasketItemUsecase {
  final BaseMyBasketItemRepository myBasketRepository;
  UpdateMyBasketItemUsecase(this.myBasketRepository);

  Future<Either<Failure, Unit>> call({
    required MyBasketItem myBasketItem,
  }) async {
    return await myBasketRepository.updateMyBasketItem(
        myBasketItem: myBasketItem);
  }
}
