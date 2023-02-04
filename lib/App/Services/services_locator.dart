import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nectar_mac/Modules/Department/domain/Repository/base_department_repository.dart';

import '../../Modules/Department/data/DataSource/department_remote_data_source.dart';
import '../../Modules/Department/data/Repository/department_repository.dart';
import '../../Modules/Department/domain/UseCases/get_departments_usecase.dart';
import 'network_services.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() async {
    // Internet Checker
    sl.registerLazySingleton<NetworkService>(() => NetworkConnection(sl()));

    /// Bloc
    // sl.registerFactory(() => DepartmentsBloc(sl(), sl(), sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetAllDepartmentUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseDepartmentRepository>(
      () => DepartmentRepository(
        localDepartmentDataSource: sl(),
        networkService: sl(),
        remoteDepartmentDataSource: sl(),
      ),
    );

    /// Data Source
    sl.registerLazySingleton<BaseDepartmentRemoteDataSource>(
        () => DepartmentRemoteDataSource(client: sl()));

    /// External
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton(() => http.Client());
    sl.registerLazySingleton(() => InternetConnectionChecker());
  }
}
