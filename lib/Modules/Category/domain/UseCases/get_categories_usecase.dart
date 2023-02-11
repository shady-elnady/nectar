import 'package:dartz/dartz.dart';

import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Models/base_usecase.dart';

import '../Entities/category.dart';
import '../Repository/base_category_repository.dart';

class GetAllCategoryesUseCase
    extends BaseUseCase<List<Category>, NoParameters> {
  final BaseCategoryRepository categoryRepository;

  GetAllCategoryesUseCase(this.categoryRepository);

  @override
  Future<Either<Failure, List<Category>>> call({
    required NoParameters parameters,
  }) async {
    return await categoryRepository.getAllCategories();
  }
}
