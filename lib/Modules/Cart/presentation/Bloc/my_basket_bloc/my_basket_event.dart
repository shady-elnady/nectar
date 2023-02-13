part of 'my_basket_bloc.dart';

abstract class MyBasketEvent extends Equatable {
  const MyBasketEvent();

  @override
  List<Object> get props => [];
}

class GetMyBasketEvent extends MyBasketEvent {
  const GetMyBasketEvent();

  @override
  List<Object> get props => [];
}

class AddMyBasketItemEvent extends MyBasketEvent {
  final MyBasketItem myBasketItem;

  const AddMyBasketItemEvent({
    required this.myBasketItem,
  });

  @override
  List<Object> get props => [
        myBasketItem,
      ];
}

class UpdateMyBasketItemEvent extends MyBasketEvent {
  final MyBasketItem myBasketItem;
  const UpdateMyBasketItemEvent({
    required this.myBasketItem,
  });

  @override
  List<Object> get props => [
        myBasketItem,
      ];
}

class DeleteMyBasketItemEvent extends MyBasketEvent {
  final Product product;

  const DeleteMyBasketItemEvent({
    required this.product,
  });

  @override
  List<Object> get props => [
        product,
      ];
}
