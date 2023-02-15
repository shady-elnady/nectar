import 'package:nectar_mac/App/Exceptions/failure.dart';

import 'package:dartz/dartz.dart';

import '../../Entities/my_cart.dart';
import '../../Repository/base_my_cart_repository.dart';

class GetAllMyCartsUsecase {
  final BaseMyCartRepository myCartRepository;

  GetAllMyCartsUsecase(this.myCartRepository);

  Future<Either<Failure, List<MyCart>>> call() {
    return myCartRepository.getAllFinishedMyCarts();
  }
}
