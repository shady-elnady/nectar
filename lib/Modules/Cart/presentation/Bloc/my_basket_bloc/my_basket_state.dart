part of 'my_basket_bloc.dart';

abstract class MyBasketState extends Equatable {
  const MyBasketState();

  @override
  List<Object> get props => [];
}

class InitialMyBasketState extends MyBasketState {}

class LoadingMyBasketState extends MyBasketState {}

class LoadedMyBasketState extends MyBasketState {
  final MyBasket myBasket;

  const LoadedMyBasketState({required this.myBasket});

  @override
  List<Object> get props => [
        myBasket,
      ];
}

class ErrorMyBasketState extends MyBasketState {
  final String message;

  const ErrorMyBasketState({required this.message});

  @override
  List<Object> get props => [
        message,
      ];
}
