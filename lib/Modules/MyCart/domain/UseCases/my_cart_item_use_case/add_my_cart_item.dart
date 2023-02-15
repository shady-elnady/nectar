import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../Entities/my_cart_item.dart';
import '../../Repository/base_my_cart_item_repository.dart';

class AddMyCartItemUsecase {
  final BaseMyCartItemRepository myCartItemRepository;
  AddMyCartItemUsecase({
    required this.myCartItemRepository,
  });

  Future<Either<Failure, Unit>> call({
    required MyCartItem myCartItem,
  }) async {
    return await myCartItemRepository.addMyCartItem(
      myCartItem: myCartItem,
    );
  }
}
