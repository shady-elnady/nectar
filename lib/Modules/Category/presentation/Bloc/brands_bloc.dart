import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Models/base_usecase.dart';

import '../../domain/Entities/brand.dart';
import '../../domain/UseCases/get_brands_usecase.dart';

part 'brands_event.dart';
part 'brands_state.dart';

class BrandBloc extends Bloc<BrandsEvent, BrandsState> {
  final GetAllBrandsUseCase getAllBrands;
  BrandBloc({
    required this.getAllBrands,
  }) : super(InitialBrandsState()) {
    on<BrandsEvent>((event, emit) async {
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

  BrandsState _mapFailureOrPostsToState(Either<Failure, List<Brand>> either) {
    return either.fold(
      (failure) => ErrorBrandsState(message: FailureToMessage.call(failure)),
      (brands) => LoadedBrandsState(
        brands: brands,
      ),
    );
  }
}
