part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class InitialProductState extends ProductState {}

class LoadingProductsState extends ProductState {}

class LoadedProductsState extends ProductState {
  final List<Product> products;

  const LoadedProductsState({required this.products});

  @override
  List<Object> get props => [
        products,
      ];
}

class ErrorProductsState extends ProductState {
  final String message;

  const ErrorProductsState({required this.message});

  @override
  List<Object> get props => [
        message,
      ];
}
