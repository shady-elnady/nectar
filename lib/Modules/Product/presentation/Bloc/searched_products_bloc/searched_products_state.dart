part of 'searched_products_bloc.dart';

abstract class SearchedProductState extends Equatable {
  const SearchedProductState();

  @override
  List<Object> get props => [];
}

class InitialSearchedProductsState extends SearchedProductState {}

class LoadingSearchedProductsState extends SearchedProductState {}

class LoadedSearchedProductsByNameState extends SearchedProductState {
  final List<Product> searchedProducts;

  const LoadedSearchedProductsByNameState({
    required this.searchedProducts,
  });

  @override
  List<Object> get props => [
        searchedProducts,
      ];
}

class LoadedSearchedProductsByCategoryState extends SearchedProductState {
  final List<Product> searchedProducts;

  const LoadedSearchedProductsByCategoryState({
    required this.searchedProducts,
  });

  @override
  List<Object> get props => [
        searchedProducts,
      ];
}

class ErrorSearchedProductsState extends SearchedProductState {
  final String message;

  const ErrorSearchedProductsState({required this.message});

  @override
  List<Object> get props => [
        message,
      ];
}
