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
import 'package:nectar_mac/Modules/MyCart/data/DataSource/my_cart_items_local_data_source.dart';
import 'package:nectar_mac/Modules/MyCart/data/DataSource/my_cart_items_remote_data_source.dart';
import 'package:nectar_mac/Modules/MyCart/data/DataSource/my_cart_local_data_source.dart';
import 'package:nectar_mac/Modules/MyCart/data/DataSource/my_cart_remote_data_source.dart';
import 'package:nectar_mac/Modules/MyCart/data/Repository/my_cart_item_repository.dart';
import 'package:nectar_mac/Modules/MyCart/data/Repository/my_cart_repository.dart';
import 'package:nectar_mac/Modules/MyCart/domain/Repository/base_my_cart_item_repository.dart';
import 'package:nectar_mac/Modules/MyCart/domain/Repository/base_my_cart_repository.dart';
import "package:nectar_mac/Modules/MyCart/domain/UseCases/my_cart_item_use_case/index.dart";
import 'package:nectar_mac/Modules/MyCart/presentation/Bloc/my_cart_bloc/my_cart_bloc.dart';
import 'package:nectar_mac/Modules/MyCart/presentation/Bloc/my_cart_item_bloc/my_cart_item_bloc.dart';
import 'package:nectar_mac/Modules/Product/data/DataSource/Product_local_data_source.dart';
import 'package:nectar_mac/Modules/Product/data/DataSource/favorite_product_local_data_source.dart';
import 'package:nectar_mac/Modules/Product/data/DataSource/favorite_product_remote_data_source.dart';
import 'package:nectar_mac/Modules/Product/data/DataSource/product_remote_data_source.dart';
import 'package:nectar_mac/Modules/Product/data/Repository/favorite_product_repository.dart';
import 'package:nectar_mac/Modules/Product/data/Repository/product_repository.dart';
import 'package:nectar_mac/Modules/Product/domain/Repository/base_favorite_product_repository.dart';
import 'package:nectar_mac/Modules/Product/domain/Repository/base_product_repository.dart';
import 'package:nectar_mac/Modules/Product/presentation/Bloc/add_delete_favorite_product_bloc/add_delete_favorite_product_bloc.dart';
import 'package:nectar_mac/Modules/Product/presentation/Bloc/all_favorite_products_bloc/all_favorite_products_bloc.dart';
import 'package:nectar_mac/Modules/Product/presentation/Bloc/all_products_bloc/all_products_bloc.dart';
import 'package:nectar_mac/Modules/Product/presentation/Bloc/searched_products_bloc/searched_products_bloc.dart';
import 'package:nectar_mac/Modules/Profile/presentation/Bloc/MyProfile/my_profile_bloc.dart';
import 'package:nectar_mac/Modules/log/data/DataSource/log_remote_data_source.dart';
import 'package:nectar_mac/Modules/log/data/DataSource/token_local_data_source.dart';
import 'package:nectar_mac/Modules/log/data/Repository/log_repository.dart';
import 'package:nectar_mac/Modules/log/domain/Repository/base_log_repository.dart';
import 'package:nectar_mac/Modules/log/domain/UseCases/index.dart';
import 'package:nectar_mac/Modules/log/presentation/bloc/log_bloc.dart';
import 'package:nectar_mac/Modules/MyCart/domain/UseCases/my_cart_use_case/index.dart';
import 'package:nectar_mac/Modules/Product/domain/UseCases/index.dart';

import 'package:shared_preferences/shared_preferences.dart';

// import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nectar_mac/Modules/Department/domain/Repository/base_department_repository.dart';

import '../../Modules/Department/data/DataSource/department_remote_data_source.dart';
import '../../Modules/Department/data/Repository/department_repository.dart';
import '../../Modules/Department/domain/UseCases/get_departments_usecase.dart';
import 'network_services.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() async {
    /// Bloc
    sl.registerFactory(() => BrandBloc(getAllBrands: sl()));
    sl.registerFactory(() => CategoryBloc(getAllCategorys: sl()));
    sl.registerFactory(() => DepartmentBloc(getAllDepartments: sl()));
    sl.registerFactory(
      () => LogBloc(
        logInUsecase: sl(),
        logUpUsecase: sl(),
        isAuthenticatedUsecase: sl(),
      ),
    );
    sl.registerFactory(() => MyCartBloc(getMyCart: sl()));
    sl.registerFactory(
      () => AddDeleteFavoriteProductCartBloc(
        addFavoriteProduct: sl(),
        deleteFavoriteProduct: sl(),
      ),
    );
    sl.registerFactory(
      () => AddDeleteUpdateToCartBloc(
        addMyCartItem: sl(),
        updateMyCartItem: sl(),
        deleteMyCartItem: sl(),
      ),
    );
    sl.registerFactory(
      () => AllFavoriteProductsBloc(
        getAllFavoriteProducts: sl(),
      ),
    );
    sl.registerFactory(() => AllProductBloc(getAllProducts: sl()));
    sl.registerFactory(() => SearchedProductBloc(getSearchedProducts: sl()));
    sl.registerFactory(() => MyProfileBloc());

    /// Use Cases
    sl.registerLazySingleton(() => GetAllBrandsUseCase(sl()));
    sl.registerLazySingleton(() => GetAllCategoryesUseCase(sl()));
    sl.registerLazySingleton(() => GetAllDepartmentUseCase(sl()));
    sl.registerLazySingleton(() => IsAuthenticatedUsecase(logRepository: sl()));
    sl.registerLazySingleton(() => LogInUsecase(logRepository: sl()));
    sl.registerLazySingleton(() => LogUpUsecase(logRepository: sl()));
    sl.registerLazySingleton(
        () => AddMyCartItemUsecase(myCartItemRepository: sl()));
    sl.registerLazySingleton(
        () => DeleteMyCartItemUsecase(myCartItemRepository: sl()));
    sl.registerLazySingleton(
        () => GetAllMyCartItemsUsecase(myCartItemRepository: sl()));
    sl.registerLazySingleton(() => DeleteMyCartUsecase(myCartRepository: sl()));
    sl.registerLazySingleton(
        () => GetAllMyCartsUsecase(myCartRepository: sl()));
    sl.registerLazySingleton(() => GetMyCartUsecase(myCartRepository: sl()));
    sl.registerLazySingleton(() => UpdateMyCartUsecase(myCartRepository: sl()));
    sl.registerLazySingleton(
        () => AddFavoriteProductUsecase(favoriteProductRepository: sl()));
    sl.registerLazySingleton(
        () => DeleteFavoriteProductUsecase(favoriteProductRepository: sl()));
    sl.registerLazySingleton(
        () => GetAllFavoriteProductsUsecase(favoriteProductRepository: sl()));
    sl.registerLazySingleton(
        () => GetAllProductUseCase(baseProductRepository: sl()));
    sl.registerLazySingleton(
        () => GetSearchedProductsUseCase(baseProductRepository: sl()));

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
    sl.registerLazySingleton<BaseMyCartRepository>(
      () => MyCartRepository(
        localMyCartDataSource: sl(),
        networkService: sl(),
        remoteMyCartDataSource: sl(),
      ),
    );
    sl.registerLazySingleton<BaseMyCartItemRepository>(
      () => MyCartItemRepository(
        localMyCartItemDataSource: sl(),
        networkService: sl(),
        remoteMyCartItemDataSource: sl(),
      ),
    );
    sl.registerLazySingleton<BaseProductRepository>(
      () => ProductRepository(
        remoteProductDataSource: sl(),
        networkService: sl(),
        localProductDataSource: sl(),
      ),
    );
    sl.registerLazySingleton<BaseFavoriteProductRepository>(
      () => FavoriteProductRepository(
        localFavoriteProductDataSource: sl(),
        networkService: sl(),
        remoteFavoriteProductDataSource: sl(),
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
    sl.registerLazySingleton<BaseMyCartRemoteDataSource>(
        () => MyCartRemoteDataSource(client: sl()));
    sl.registerLazySingleton<MyCartLocalDataSource>(
        () => MyCartLocalDataSourceImpl(sharedPreferences: sl()));
    //
    sl.registerLazySingleton<BaseMyCartItemRemoteDataSource>(
        () => MyCartItemRemoteDataSource(client: sl()));
    sl.registerLazySingleton<MyCartItemLocalDataSource>(
        () => MyCartItemLocalDataSourceImpl(sharedPreferences: sl()));
    //
    sl.registerLazySingleton<BaseFavoriteProductRemoteDataSource>(
        () => FavoriteProductRemoteDataSource(client: sl()));
    sl.registerLazySingleton<FavoriteProductLocalDataSource>(
        () => FavoriteProductLocalDataSourceImpl(sharedPreferences: sl()));
    //
    sl.registerLazySingleton<BaseProductRemoteDataSource>(
        () => ProductRemoteDataSource(client: sl()));
    sl.registerLazySingleton<ProductLocalDataSource>(
        () => ProductLocalDataSourceImpl(sharedPreferences: sl()));
    //

    /// External
    // Internet Checker
    sl.registerLazySingleton<NetworkService>(() => NetworkConnection(sl()));
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton(() => http.Client());
    // sl.registerLazySingleton(() => InternetConnectionChecker());
  }
}
