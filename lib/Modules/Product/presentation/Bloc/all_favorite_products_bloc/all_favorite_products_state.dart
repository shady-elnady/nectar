part of 'all_favorite_products_bloc.dart';

abstract class AllFavoriteProductsState extends Equatable {
  const AllFavoriteProductsState();

  @override
  List<Object> get props => [];
}

class InitialAllFavoriteProductsState extends AllFavoriteProductsState {}

class LoadingAllFavoriteProductsState extends AllFavoriteProductsState {}

class LoadedAllFavoriteProductsState extends AllFavoriteProductsState {
  final List<FavoriteProduct> favoriteProducts;

  const LoadedAllFavoriteProductsState({
    required this.favoriteProducts,
  });

  @override
  List<Object> get props => [
        favoriteProducts,
      ];
}

class ErrorAllFavoriteProductsState extends AllFavoriteProductsState {
  final String message;

  const ErrorAllFavoriteProductsState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
