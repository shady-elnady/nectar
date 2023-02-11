import 'package:dartz/dartz.dart';

import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Models/base_usecase.dart';

import '../Entities/my_cart.dart';
import '../Repository/base_my_cart_repository.dart';

class GetAllMyCartUseCase extends BaseUseCase<List<MyCart>, NoParameters> {
  final BaseMyCartRepository baseMyCartRepository;

  GetAllMyCartUseCase(this.baseMyCartRepository);

  @override
  Future<Either<Failure, List<MyCart>>> call({
    required NoParameters parameters,
  }) async {
    return await baseMyCartRepository.getAllMyCarts();
  }
}
