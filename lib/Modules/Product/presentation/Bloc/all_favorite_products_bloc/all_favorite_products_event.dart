part of 'all_favorite_products_bloc.dart';

abstract class AllFavoriteProductsEvent extends Equatable {
  const AllFavoriteProductsEvent();

  @override
  List<Object> get props => [];
}

class RefreshAllFavoriteProductsEvent extends AllFavoriteProductsEvent {}

class GetAllFavoriteProductsEvent extends AllFavoriteProductsEvent {
  const GetAllFavoriteProductsEvent();

  @override
  List<Object> get props => [];
}
