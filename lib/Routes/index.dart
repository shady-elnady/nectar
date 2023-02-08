import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_mac/App/Services/services_locator.dart';
import 'package:nectar_mac/Modules/Department/presentation/Bloc/department_bloc.dart';

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
          page: BlocProvider(
            create: (BuildContext context) => sl<DepartmentBloc>()
              // ..add(GetNowPlayingMoviesEvent())
              // ..add(GetPopularMoviesEvent())
              ..add(GetDepartmentsEvent()),
            child: BlocBuilder<DepartmentBloc, DepartmentState>(
              builder: (context, state) => const HomeScreen(),
            ),
          ),
        );
      //
      case RoutePages.categories:
        return goTo(
          page: BlocProvider(
            create: (BuildContext context) => sl<DepartmentBloc>()
              // ..add(GetNowPlayingMoviesEvent())
              // ..add(GetPopularMoviesEvent())
              ..add(GetDepartmentsEvent()),
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
