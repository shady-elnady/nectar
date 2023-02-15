import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../Entities/my_cart_item.dart';
import '../../Repository/base_my_cart_item_repository.dart';

class UpdateMyCartItemUsecase {
  final BaseMyCartItemRepository myCartRepository;
  UpdateMyCartItemUsecase({
    required this.myCartRepository,
  });

  Future<Either<Failure, Unit>> call({
    required MyCartItem myCartItem,
  }) async {
    return await myCartRepository.updateMyCartItem(
      myCartItem: myCartItem,
    );
  }
}
