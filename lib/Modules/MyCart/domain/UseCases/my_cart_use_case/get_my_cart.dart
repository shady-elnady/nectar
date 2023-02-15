import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../Entities/my_cart.dart';
import '../../Repository/base_my_cart_repository.dart';
import 'package:dartz/dartz.dart';

class GetMyCartUsecase {
  final BaseMyCartRepository myCartRepository;

  GetMyCartUsecase(this.myCartRepository);

  Future<Either<Failure, MyCart>> call() async {
    return await myCartRepository.getMyCart();
  }
}
