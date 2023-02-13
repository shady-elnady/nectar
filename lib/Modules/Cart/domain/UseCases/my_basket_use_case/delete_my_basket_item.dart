import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../../../Product/domain/Entities/product.dart';
import '../../Repository/base_my_basket_repository.dart';

class DeleteMyBasketItemUsecase {
  final BaseMyBasketRepository myBasketRepository;
  DeleteMyBasketItemUsecase(this.myBasketRepository);

  Future<Either<Failure, Unit>> call({
    required Product product,
  }) async {
    return await myBasketRepository.deleteMyBasketItem(
      product: product,
    );
  }
}
