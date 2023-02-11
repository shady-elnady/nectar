import 'package:dartz/dartz.dart';

import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Models/base_usecase.dart';

import '../Entities/product.dart';
import '../Repository/base_product_repository.dart';

class GetAllProductUseCase extends BaseUseCase<List<Product>, NoParameters> {
  final BaseProductRepository baseProductRepository;

  GetAllProductUseCase(this.baseProductRepository);

  @override
  Future<Either<Failure, List<Product>>> call({
    required NoParameters parameters,
  }) async {
    return await baseProductRepository.getAllProducts();
  }
}
