part of 'my_basket_item_bloc.dart';

abstract class MyBasketItemEvent extends Equatable {
  const MyBasketItemEvent();

  @override
  List<Object> get props => [];
}

// class GetMyBasketItemEvent extends MyBasketItemEvent {
//   const GetMyBasketItemEvent();

//   @override
//   List<Object> get props => [];
// }

class AddMyBasketItemEvent extends MyBasketItemEvent {
  final MyBasketItem myBasketItem;

  const AddMyBasketItemEvent({
    required this.myBasketItem,
  });

  @override
  List<Object> get props => [
        myBasketItem,
      ];
}

class UpdateMyBasketItemEvent extends MyBasketItemEvent {
  final MyBasketItem myBasketItem;
  const UpdateMyBasketItemEvent({
    required this.myBasketItem,
  });

  @override
  List<Object> get props => [
        myBasketItem,
      ];
}

class DeleteMyBasketItemEvent extends MyBasketItemEvent {
  final Product product;

  const DeleteMyBasketItemEvent({
    required this.product,
  });

  @override
  List<Object> get props => [
        product,
      ];
}
