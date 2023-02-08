import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../Entities/category.dart';

abstract class BaseCategoryRepository {
  Future<Either<Failure, List<Category>>> getAllCategories();
}
