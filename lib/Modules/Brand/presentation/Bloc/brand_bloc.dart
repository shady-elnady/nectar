import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Models/base_usecase.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';

import '../../domain/Entities/brand.dart';
import '../../domain/UseCases/get_brands_usecase.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final GetAllBrandUseCase getAllBrands;
  BrandBloc({
    required this.getAllBrands,
  }) : super(InitialBrandState()) {
    on<BrandEvent>((event, emit) async {
      if (event is GetBrandsEvent) {
        emit(LoadingBrandsState());

        final failureOrPosts = await getAllBrands(const NoParameters());
        emit(_mapFailureOrPostsToState(failureOrPosts));
      } else if (event is RefreshBrandsEvent) {
        emit(LoadingBrandsState());

        final failureOrPosts = await getAllBrands(const NoParameters());
        emit(_mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }

  BrandState _mapFailureOrPostsToState(Either<Failure, List<Brand>> either) {
    return either.fold(
      (failure) => ErrorBrandsState(message: _mapFailureToMessage(failure)),
      (brands) => LoadedBrandsState(
        brands: brands,
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
