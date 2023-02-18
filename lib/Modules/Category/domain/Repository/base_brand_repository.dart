import 'package:dartz/dartz.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../Entities/brand.dart';

abstract class BaseBrandRepository {
  Future<Either<Failure, List<Brand>>> getAllBrands();
}
