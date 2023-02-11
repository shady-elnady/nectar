part of 'brands_bloc.dart';

abstract class BrandsState extends Equatable {
  const BrandsState();

  @override
  List<Object> get props => [];
}

class InitialBrandsState extends BrandsState {}

class LoadingBrandsState extends BrandsState {}

class LoadedBrandsState extends BrandsState {
  final List<Brand> brands;

  const LoadedBrandsState({required this.brands});

  @override
  List<Object> get props => [
        brands,
      ];
}

class ErrorBrandsState extends BrandsState {
  final String message;

  const ErrorBrandsState({required this.message});

  @override
  List<Object> get props => [
        message,
      ];
}
