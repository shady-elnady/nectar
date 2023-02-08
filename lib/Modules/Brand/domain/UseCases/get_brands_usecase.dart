import 'package:dartz/dartz.dart';

import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Models/base_usecase.dart';

import '../Entities/Brand.dart';
import '../Repository/base_Brand_repository.dart';

class GetAllBrandUseCase extends BaseUseCase<List<Brand>, NoParameters> {
  final BaseBrandRepository baseBrandRepository;

  GetAllBrandUseCase(this.baseBrandRepository);

  @override
  Future<Either<Failure, List<Brand>>> call(NoParameters parameters) async {
    return await baseBrandRepository.getAllBrands();
  }
}
