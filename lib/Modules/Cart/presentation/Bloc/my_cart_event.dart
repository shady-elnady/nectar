part of 'my_cart_bloc.dart';

abstract class MyCartEvent extends Equatable {
  const MyCartEvent();

  @override
  List<Object> get props => [];
}

class RefreshMyCartsEvent extends MyCartEvent {}

class GetMyCartsEvent extends MyCartEvent {}
