import 'package:dartz/dartz.dart';

import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Models/base_usecase.dart';

import '../Entities/department.dart';
import '../Repository/base_department_repository.dart';

class GetAllDepartmentUseCase
    extends BaseUseCase<List<Department>, NoParameters> {
  final BaseDepartmentRepository baseDepartmentRepository;

  GetAllDepartmentUseCase(this.baseDepartmentRepository);

  @override
  Future<Either<Failure, List<Department>>> call({
    required NoParameters parameters,
  }) async {
    return await baseDepartmentRepository.getAllDepartments();
  }
}
