part of 'my_cart_bloc.dart';

abstract class MyCartEvent extends Equatable {
  const MyCartEvent();

  @override
  List<Object> get props => [];
}

class RefreshMyCartEvent extends MyCartEvent {}

class GetMyCartEvent extends MyCartEvent {}
