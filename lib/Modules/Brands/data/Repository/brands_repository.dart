// import 'package:dartz/dartz.dart';

// import 'package:nectar_mac/App/Exceptions/exceptions.dart';
// import 'package:nectar_mac/App/Exceptions/failure.dart';
// import 'package:nectar_mac/App/Services/network_services.dart';
// import 'package:nectar_mac/App/Utils/Strings/messages.dart';

// import '../../domain/Entities/department.dart';
// import '../../domain/Repository/base_department_repository.dart';
// import '../DataSource/department_local_data_source.dart';
// import '../DataSource/department_remote_data_source.dart';
// import '../Models/department_model.dart';

// class DepartmentRepository extends BaseDepartmentRepository {
//   final BaseDepartmentRemoteDataSource remoteDepartmentDataSource;
//   final DepartmentLocalDataSource localDepartmentDataSource;
//   final NetworkService networkService;

//   DepartmentRepository({
//     required this.remoteDepartmentDataSource,
//     required this.localDepartmentDataSource,
//     required this.networkService,
//   });

//   @override
//   Future<Either<Failure, List<Department>>> getAllDepartments() async {
//     if (await networkService.isConnected) {
//       try {
//         List<DepartmentModel> remoteDepartments =
//             await remoteDepartmentDataSource.getAllDepartments();
//         localDepartmentDataSource.cacheDepartments(remoteDepartments);
//         return Right(remoteDepartments);
//       } on ServerException catch (failure) {
//         return Left(ServerFailure(failure.errorMessageModel.statusMessage));
//       }
//     } else {
//       try {
//         List<DepartmentModel> localDepartments =
//             await localDepartmentDataSource.getCachedDepartments();
//         return Right(localDepartments);
//       } on EmptyCacheException {
//         return const Left(
//           EmptyCacheFailure(
//             Meassages.emptyCacheData,
//           ),
//         );
//       }
//     }
//   }
// }
