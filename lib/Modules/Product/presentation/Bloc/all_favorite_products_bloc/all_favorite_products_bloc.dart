import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../../domain/Entities/favorite_product.dart';
import '../../../domain/UseCases/favorite_product_use_case/index.dart';

part 'all_favorite_products_event.dart';
part 'all_favorite_products_state.dart';

class AllFavoriteProductsBloc
    extends Bloc<AllFavoriteProductsEvent, AllFavoriteProductsState> {
  final GetAllFavoriteProductsUsecase getAllFavoriteProducts;
  AllFavoriteProductsBloc({
    required this.getAllFavoriteProducts,
  }) : super(InitialAllFavoriteProductsState()) {
    on<AllFavoriteProductsEvent>((event, emit) async {
      if (event is GetAllFavoriteProductsEvent ||
          event is RefreshAllFavoriteProductsEvent) {
        emit(LoadingAllFavoriteProductsState());

        final failureOrAllFavoriteProducts = await getAllFavoriteProducts();
        emit(_mapFailureOrAllFavoriteProductsToState(
            failureOrAllFavoriteProducts));
      }
    });
  }

  AllFavoriteProductsState _mapFailureOrAllFavoriteProductsToState(
      Either<Failure, List<FavoriteProduct>> either) {
    return either.fold(
      (failure) => ErrorAllFavoriteProductsState(
          message: FailureToMessage.call(
        failure: failure,
      )),
      (favoriteProducts) => LoadedAllFavoriteProductsState(
        favoriteProducts: favoriteProducts,
      ),
    );
  }
}
