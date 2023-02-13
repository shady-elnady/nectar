part of 'all_my_carts_bloc.dart';

abstract class AllMyCartsState extends Equatable {
  const AllMyCartsState();

  @override
  List<Object> get props => [];
}

class InitialAllMyCartsState extends AllMyCartsState {}

class LoadingAllMyCartsState extends AllMyCartsState {}

class LoadedAllMyCartsState extends AllMyCartsState {
  final List<MyCart> myCarts;

  const LoadedAllMyCartsState({required this.myCarts});

  @override
  List<Object> get props => [
        myCarts,
      ];
}

class ErrorAllMyCartsState extends AllMyCartsState {
  final String message;

  const ErrorAllMyCartsState({required this.message});

  @override
  List<Object> get props => [
        message,
      ];
}
