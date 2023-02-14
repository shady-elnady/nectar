part of 'my_basket_bloc.dart';

abstract class MyBasketEvent extends Equatable {
  const MyBasketEvent();

  @override
  List<Object> get props => [];
}

class RefreshMyBasketEvent extends MyBasketEvent {}

class GetMyBasketEvent extends MyBasketEvent {}
