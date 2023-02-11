part of 'my_basket_bloc.dart';

abstract class CRUDMyBasketEvent extends Equatable {
  const CRUDMyBasketEvent();

  @override
  List<Object> get props => [];
}

class AddToMyBasketEvent extends CRUDMyBasketEvent {
  final LineInMyCart lineInMyCart;

  const AddToMyBasketEvent({
    required this.lineInMyCart,
  });

  @override
  List<Object> get props => [
        lineInMyCart,
      ];
}

class UpdateToMyBasketEvent extends CRUDMyBasketEvent {
  final LineInMyCart lineInMyCart;

  const UpdateToMyBasketEvent({
    required this.lineInMyCart,
  });

  @override
  List<Object> get props => [
        lineInMyCart,
      ];
}

class DeleteFromMyBasketEvent extends CRUDMyBasketEvent {
  final int postId;

  const DeleteFromMyBasketEvent({required this.postId});

  @override
  List<Object> get props => [postId];
}
