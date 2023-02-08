part of 'Brand_bloc.dart';

abstract class BrandState extends Equatable {
  const BrandState();

  @override
  List<Object> get props => [];
}

class InitialBrandsState extends BrandState {}

class LoadingBrandsState extends BrandState {}

class LoadedBrandsState extends BrandState {
  final List<Brand> brands;

  const LoadedBrandsState({required this.brands});

  @override
  List<Object> get props => [
        brands,
      ];
}

class ErrorBrandsState extends BrandState {
  final String message;

  const ErrorBrandsState({required this.message});

  @override
  List<Object> get props => [
        message,
      ];
}
