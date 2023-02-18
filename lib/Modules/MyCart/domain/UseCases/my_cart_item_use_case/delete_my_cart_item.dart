import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../Repository/base_my_cart_item_repository.dart';

class DeleteMyCartItemUsecase {
  final BaseMyCartItemRepository myCartItemRepository;
  DeleteMyCartItemUsecase({
    required this.myCartItemRepository,
  });

  Future<Either<Failure, Unit>> call({
    required String myCartItemURL,
  }) async {
    return await myCartItemRepository.deleteMyCartItem(
      myCartItemURL: myCartItemURL,
    );
  }
}
