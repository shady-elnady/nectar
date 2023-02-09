import 'package:dartz/dartz.dart';

import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Models/base_usecase.dart';

import '../Entities/brand.dart';
import '../Repository/base_brands_repository.dart';

class GetAllBrandsUseCase extends BaseUseCase<List<Brand>, NoParameters> {
  final BaseBrandsRepository baseBrandsRepository;

  GetAllBrandsUseCase(this.baseBrandsRepository);

  @override
  Future<Either<Failure, List<Brand>>> call(NoParameters parameters) async {
    return await baseBrandsRepository.getAllBrands();
  }
}
