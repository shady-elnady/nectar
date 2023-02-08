part of 'my_cart_bloc.dart';

abstract class MyCartState extends Equatable {
  const MyCartState();

  @override
  List<Object> get props => [];
}

class InitialMyCartState extends MyCartState {}

class LoadingMyCartsState extends MyCartState {}

class LoadedMyCartsState extends MyCartState {
  final List<MyCart> myCarts;

  const LoadedMyCartsState({required this.myCarts});

  @override
  List<Object> get props => [
        myCarts,
      ];
}

class ErrorMyCartsState extends MyCartState {
  final String message;

  const ErrorMyCartsState({required this.message});

  @override
  List<Object> get props => [
        message,
      ];
}
