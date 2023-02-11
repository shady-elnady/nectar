import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../../domain/Entities/product.dart';
import '../../../domain/UseCases/get_searched_product_usecase.dart';

part 'searched_products_event.dart';
part 'searched_products_state.dart';

class SearchedProductBloc
    extends Bloc<SearchedProductEvent, SearchedProductState> {
  final GetSearchedProductsUseCase getSearchedProducts;
  SearchedProductBloc({
    required this.getSearchedProducts,
  }) : super(InitialSearchedProductsState()) {
    on<SearchedProductEvent>((event, emit) async {
      if (event is GetSearchedProductsByNameEvent ||
          event is RefreshSearchedProductsByNameEvent) {
        emit(LoadingSearchedProductsState());

        final failureOrSearchedProducts = await getSearchedProducts(
          parameters: SearchProductsParameters(
            searchMap: {
              "contain_name": event.searchWord,
            },
          ),
        );
        emit(_mapFailureOrSearchedProductsByNameToState(
            failureOrSearchedProducts));
      } else if (event is RefreshSearchedProductsByCategoryEvent ||
          event is RefreshSearchedProductsByCategoryEvent) {
        emit(LoadingSearchedProductsState());

        final failureOrSearchedProducts = await getSearchedProducts(
          parameters: SearchProductsParameters(
            searchMap: {
              "category_name": event.searchWord,
            },
          ),
        );
        emit(_mapFailureOrSearchedProductsByCategoryToState(
            failureOrSearchedProducts));
      }
    });
  }

  SearchedProductState _mapFailureOrSearchedProductsByNameToState(
      Either<Failure, List<Product>> either) {
    return either.fold(
      (failure) => ErrorSearchedProductsState(
        message: FailureToMessage.call(failure),
      ),
      (searchedProducts) => LoadedSearchedProductsByNameState(
        searchedProducts: searchedProducts,
      ),
    );
  }

  SearchedProductState _mapFailureOrSearchedProductsByCategoryToState(
      Either<Failure, List<Product>> either) {
    return either.fold(
      (failure) => ErrorSearchedProductsState(
        message: FailureToMessage.call(failure),
      ),
      (searchedProducts) => LoadedSearchedProductsByCategoryState(
        searchedProducts: searchedProducts,
      ),
    );
  }
}
