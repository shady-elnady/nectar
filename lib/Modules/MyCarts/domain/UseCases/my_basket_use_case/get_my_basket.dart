import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../Entities/my_basket.dart';
import '../../Repository/base_my_basket_repository.dart';
import 'package:dartz/dartz.dart';

class GetMyBasketUsecase {
  final BaseMyBasketRepository myBasketRepository;

  GetMyBasketUsecase(this.myBasketRepository);

  Future<Either<Failure, MyBasket>> call() async {
    return await myBasketRepository.getMyBasket();
  }
}
