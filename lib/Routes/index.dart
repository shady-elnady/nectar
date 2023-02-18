import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_mac/App/Services/services_locator.dart';
import 'package:nectar_mac/Modules/Category/presentation/Bloc/Brands/brands_bloc.dart';
import 'package:nectar_mac/Modules/Category/presentation/Bloc/Category/category_bloc.dart';
import 'package:nectar_mac/Modules/Department/presentation/Bloc/department_bloc.dart';
import 'package:nectar_mac/Modules/MyCart/presentation/Bloc/my_cart_bloc/my_cart_bloc.dart';
import 'package:nectar_mac/Modules/MyCart/presentation/Bloc/my_cart_item_bloc/my_cart_item_bloc.dart';
import 'package:nectar_mac/Modules/Product/presentation/Bloc/add_delete_favorite_product_bloc/add_delete_favorite_product_bloc.dart';
import 'package:nectar_mac/Modules/Product/presentation/Bloc/all_favorite_products_bloc/all_favorite_products_bloc.dart';
import 'package:nectar_mac/Modules/Product/presentation/Bloc/all_products_bloc/all_products_bloc.dart';
import 'package:nectar_mac/Modules/Product/presentation/Bloc/searched_products_bloc/searched_products_bloc.dart';
import 'package:nectar_mac/Modules/Profile/presentation/Bloc/MyProfile/my_profile_bloc.dart';

import '../Modules/Category/presentation/Pages/categories.dart';
import '../Modules/log/presentation/Pages/index.dart';
import '../views/Pages/index.dart';
import 'not_found_page.dart';

part 'route_pages.dart';

class Routes extends RoutePages {
  static MaterialPageRoute<dynamic> goTo({required Widget page}) =>
      MaterialPageRoute(
        builder: (BuildContext context) => page,
      );

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      //
      case RoutePages.intial:
        return goTo(
          page: const SplashScreen(),
        );
      //
      case RoutePages.wellcome:
        return goTo(
          page: const WelcomeScreen(),
        );
      //
      case RoutePages.singInScreen:
        return goTo(
          page: const SingInScreen(),
        );
      //
      case RoutePages.numberScreen:
        return goTo(
          page: const NumberScreen(),
        );
      //
      case RoutePages.verificationScreen:
        return goTo(
          page: const VerificationScreen(),
        );
      //
      case RoutePages.locationScreen:
        return goTo(
          page: const LocationScreen(),
        );
      //
      case RoutePages.logingScreen:
        return goTo(
          page: const LogingScreen(),
        );
      //
      case RoutePages.signUpScreen:
        return goTo(
          page: const SignUpScreen(),
        );
      //
      case RoutePages.homeScreen:
        return goTo(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => sl<BrandBloc>()
                  ..add(
                    GetBrandsEvent(),
                  ),
              ),
              BlocProvider(
                create: (_) => sl<CategoryBloc>()
                  ..add(
                    GetCategoriesEvent(),
                  ),
              ),
              BlocProvider(
                create: (_) => sl<DepartmentBloc>()
                  ..add(
                    GetDepartmentsEvent(),
                  ),
              ),
              BlocProvider(
                create: (_) => sl<MyCartBloc>()
                  ..add(
                    GetMyCartEvent(),
                  ),
              ),
              BlocProvider(
                create: (_) => sl<AddDeleteUpdateToCartBloc>(),
              ),
              BlocProvider(
                create: (_) => sl<AddDeleteFavoriteProductCartBloc>(),
              ),
              BlocProvider(
                create: (_) => sl<AllFavoriteProductsBloc>(),
              ),
              BlocProvider(
                create: (_) => sl<AllProductBloc>(),
              ),
              BlocProvider(
                create: (_) => sl<SearchedProductBloc>(),
              ),
              BlocProvider(
                create: (_) => sl<MyProfileBloc>(),
              ),
            ],
            child: const HomeScreen(),
          ),
        );
      //
      case RoutePages.categories:
        return goTo(
          page: BlocProvider(
            create: (BuildContext context) =>
                sl<DepartmentBloc>()..add(GetDepartmentsEvent()),
            child: BlocBuilder<DepartmentBloc, DepartmentState>(
              builder: (context, state) => const Categories(),
            ),
          ),
        );
      //
      default:
        return goTo(
          page: const RouteNotFound(),
        );
    }
  }
}
