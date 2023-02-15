import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../Entities/my_cart.dart';
import '../../Repository/base_my_cart_repository.dart';

class UpdateMyCartUsecase {
  final BaseMyCartRepository myCartRepository;
  UpdateMyCartUsecase({
    required this.myCartRepository,
  });

  Future<Either<Failure, Unit>> call({
    required MyCart myCart,
  }) async {
    return await myCartRepository.updateMyCart(
      myCart: myCart,
    );
  }
}
