import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../Entities/my_basket_item.dart';
import '../../Repository/base_my_basket_item_repository.dart';

class AddMyBasketItemUsecase {
  final BaseMyBasketItemRepository myBasketItemRepository;
  AddMyBasketItemUsecase({
    required this.myBasketItemRepository,
  });

  Future<Either<Failure, Unit>> call({
    required MyBasketItem myBasketItem,
  }) async {
    return await myBasketItemRepository.addMyBasketItem(
      myBasketItem: myBasketItem,
    );
  }
}
