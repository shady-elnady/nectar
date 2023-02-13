part of 'all_my_carts_bloc.dart';

abstract class AllMyCartsEvent extends Equatable {
  const AllMyCartsEvent();

  @override
  List<Object> get props => [];
}

class RefreshAllMyCartsEvent extends AllMyCartsEvent {}

class GetAllMyCartsEvent extends AllMyCartsEvent {}
