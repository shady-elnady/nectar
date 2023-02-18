import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:nectar_mac/Modules/Category/data/DataSource/brands_local_data_source.dart';
import 'package:nectar_mac/Modules/Category/data/DataSource/brands_remote_data_source.dart';
import 'package:nectar_mac/Modules/Category/data/DataSource/category_local_data_source.dart';
import 'package:nectar_mac/Modules/Category/data/DataSource/category_remote_data_source.dart';
import 'package:nectar_mac/Modules/Category/data/Repository/brands_repository.dart';
import 'package:nectar_mac/Modules/Category/data/Repository/category_repository.dart';
import 'package:nectar_mac/Modules/Category/domain/Repository/base_brand_repository.dart';
import 'package:nectar_mac/Modules/Category/domain/Repository/base_category_repository.dart';
import 'package:nectar_mac/Modules/Category/domain/UseCases/get_brands_usecase.dart';
import 'package:nectar_mac/Modules/Category/domain/UseCases/get_categories_usecase.dart';
import 'package:nectar_mac/Modules/Category/presentation/Bloc/Brands/brands_bloc.dart';
import 'package:nectar_mac/Modules/Category/presentation/Bloc/Category/category_bloc.dart';
import 'package:nectar_mac/Modules/Department/data/DataSource/department_local_data_source.dart';
import 'package:nectar_mac/Modules/Department/presentation/Bloc/department_bloc.dart';
import 'package:nectar_mac/Modules/log/data/DataSource/log_remote_data_source.dart';
import 'package:nectar_mac/Modules/log/data/DataSource/token_local_data_source.dart';
import 'package:nectar_mac/Modules/log/data/Repository/log_repository.dart';
import 'package:nectar_mac/Modules/log/domain/Repository/base_log_repository.dart';
import 'package:nectar_mac/Modules/log/domain/UseCases/is_authenticated_usecase.dart';
import 'package:nectar_mac/Modules/log/domain/UseCases/log_in_usecase.dart';
import 'package:nectar_mac/Modules/log/domain/UseCases/log_out_usecase.dart';
import 'package:nectar_mac/Modules/log/domain/UseCases/log_up_usecase.dart';
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
    sl.registerFactory(() => BrandBloc(getAllBrands: sl()));
    sl.registerFactory(() => CategoryBloc(getAllCategorys: sl()));
    sl.registerFactory(() => DepartmentBloc(getAllDepartments: sl()));
    sl.registerFactory(() => DepartmentBloc(getAllDepartments: sl()));
    sl.registerFactory(() => DepartmentBloc(getAllDepartments: sl()));
    sl.registerFactory(() => DepartmentBloc(getAllDepartments: sl()));
    sl.registerFactory(() => DepartmentBloc(getAllDepartments: sl()));
    sl.registerFactory(() => DepartmentBloc(getAllDepartments: sl()));
    sl.registerFactory(() => DepartmentBloc(getAllDepartments: sl()));
    sl.registerFactory(() => DepartmentBloc(getAllDepartments: sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetAllBrandsUseCase(sl()));
    sl.registerLazySingleton(() => GetAllCategoryesUseCase(sl()));
    sl.registerLazySingleton(() => GetAllDepartmentUseCase(sl()));
    sl.registerLazySingleton(() => IsAuthenticatedUsecase(logRepository: sl()));
    sl.registerLazySingleton(() => LogInUsecase(logRepository: sl()));
    sl.registerLazySingleton(() => LogOutUsecase(logRepository: sl()));
    sl.registerLazySingleton(() => LogUpUsecase(logRepository: sl()));

    /// Repository
    sl.registerLazySingleton<BaseBrandRepository>(
      () => BrandsRepository(
        localBrandsDataSource: sl(),
        networkService: sl(),
        remoteBrandsDataSource: sl(),
      ),
    );
    sl.registerLazySingleton<BaseCategoryRepository>(
      () => CategoriesRepository(
        localCategoriesDataSource: sl(),
        networkService: sl(),
        remoteCategoriesDataSource: sl(),
      ),
    );
    sl.registerLazySingleton<BaseDepartmentRepository>(
      () => DepartmentRepository(
        localDepartmentDataSource: sl(),
        networkService: sl(),
        remoteDepartmentDataSource: sl(),
      ),
    );
    sl.registerLazySingleton<BaseLogRepository>(
      () => LogRepository(
        localTokenDataSource: sl(),
        networkService: sl(),
        remoteLogDataSource: sl(),
      ),
    );

    /// Data Source
    //
    sl.registerLazySingleton<BaseBrandsRemoteDataSource>(
        () => BrandsRemoteDataSource(client: sl()));
    sl.registerLazySingleton<BaseBrandLocalDataSource>(
        () => BrandsLocalDataSourceImpl(sharedPreferences: sl()));
    //
    sl.registerLazySingleton<BaseCategoryRemoteDataSource>(
        () => CategoriesRemoteDataSource(client: sl()));
    sl.registerLazySingleton<BaseCategoryLocalDataSource>(
        () => CategoriesLocalDataSourceImpl(sharedPreferences: sl()));
    //
    sl.registerLazySingleton<BaseDepartmentRemoteDataSource>(
        () => DepartmentRemoteDataSource(client: sl()));
    sl.registerLazySingleton<DepartmentLocalDataSource>(
        () => DepartmentLocalDataSourceImpl(sharedPreferences: sl()));
    //
    sl.registerLazySingleton<BaseLogRemoteDataSource>(
        () => LogRemoteDataSource(client: sl()));
    sl.registerLazySingleton<BaseTokenLocalDataSource>(
        () => TokenLocalDataSourceImpl(sharedPreferences: sl()));
    //

    /// External
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton(() => http.Client());
    sl.registerLazySingleton(() => InternetConnectionChecker());
  }
}
