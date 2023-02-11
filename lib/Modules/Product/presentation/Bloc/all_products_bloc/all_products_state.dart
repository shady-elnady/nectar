part of 'all_products_bloc.dart';

abstract class AllProductState extends Equatable {
  const AllProductState();

  @override
  List<Object> get props => [];
}

class InitialAllProductsState extends AllProductState {}

class LoadingAllProductsState extends AllProductState {}

class LoadedAllProductsState extends AllProductState {
  final List<Product> products;

  const LoadedAllProductsState({
    required this.products,
  });

  @override
  List<Object> get props => [
        products,
      ];
}

class ErrorAllProductsState extends AllProductState {
  final String message;

  const ErrorAllProductsState({required this.message});

  @override
  List<Object> get props => [
        message,
      ];
}
