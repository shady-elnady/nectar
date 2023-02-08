import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Models/base_usecase.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';

import '../../domain/Entities/category.dart';
import '../../domain/UseCases/get_categories_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetAllCategoryesUseCase getAllCategorys;
  CategoryBloc({
    required this.getAllCategorys,
  }) : super(InitialCategoriesState()) {
    on<CategoryEvent>((event, emit) async {
      if (event is GetCategoriesEvent) {
        emit(LoadingCategoriesState());

        final failureOrPosts = await getAllCategorys(const NoParameters());
        emit(_mapFailureOrPostsToState(failureOrPosts));
      } else if (event is RefreshCategoriesEvent) {
        emit(LoadingCategoriesState());

        final failureOrPosts = await getAllCategorys(const NoParameters());
        emit(_mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }

  CategoryState _mapFailureOrPostsToState(
      Either<Failure, List<Category>> either) {
    return either.fold(
      (failure) => ErrorCategoriesState(message: _mapFailureToMessage(failure)),
      (categories) => LoadedCategoriesState(
        categories: categories,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Meassages.serverFailure;
      case EmptyCacheFailure:
        return Meassages.emptyCacheData;
      case OfflineFailure:
        return Meassages.offLineConnection;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}