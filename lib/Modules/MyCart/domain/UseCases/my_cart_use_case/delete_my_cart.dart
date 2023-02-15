import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../Repository/base_my_cart_repository.dart';

class DeleteMyCartUsecase {
  final BaseMyCartRepository myCartRepository;
  DeleteMyCartUsecase(this.myCartRepository);

  Future<Either<Failure, Unit>> call({
    required String myCartURL,
  }) async {
    return await myCartRepository.deleteMyCart(
      myCartURL: myCartURL,
    );
  }
}
