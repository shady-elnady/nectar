import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../../../Product/domain/Entities/product.dart';
import '../../Repository/base_my_basket_item_repository.dart';

class DeleteMyBasketItemUsecase {
  final BaseMyBasketItemRepository myBasketItemRepository;
  DeleteMyBasketItemUsecase(this.myBasketItemRepository);

  Future<Either<Failure, Unit>> call({
    required Product product,
  }) async {
    return await myBasketItemRepository.deleteMyBasketItem(
      product: product,
    );
  }
}
