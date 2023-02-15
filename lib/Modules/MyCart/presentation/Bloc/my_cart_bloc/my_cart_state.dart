part of 'my_cart_bloc.dart';

abstract class MyCartState extends Equatable {
  const MyCartState();

  @override
  List<Object> get props => [];
}

class InitialMyCartState extends MyCartState {}

class LoadingMyCartState extends MyCartState {}

class LoadedMyCartState extends MyCartState {
  final MyCart myCart;

  const LoadedMyCartState({required this.myCart});

  @override
  List<Object> get props => [
        myCart,
      ];
}

class ErrorMyCartState extends MyCartState {
  final String message;

  const ErrorMyCartState({required this.message});

  @override
  List<Object> get props => [
        message,
      ];
}
