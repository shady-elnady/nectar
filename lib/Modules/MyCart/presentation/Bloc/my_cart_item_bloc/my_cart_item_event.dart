part of 'my_cart_item_bloc.dart';

abstract class MyCartItemEvent extends Equatable {
  const MyCartItemEvent();

  @override
  List<Object> get props => [];
}

// class GetMyCartItemEvent extends MyCartItemEvent {
//   const GetMyCartItemEvent();

//   @override
//   List<Object> get props => [];
// }

class AddMyCartItemEvent extends MyCartItemEvent {
  final MyCartItem myCartItem;

  const AddMyCartItemEvent({
    required this.myCartItem,
  });

  @override
  List<Object> get props => [
        myCartItem,
      ];
}

class UpdateMyCartItemEvent extends MyCartItemEvent {
  final MyCartItem myCartItem;
  const UpdateMyCartItemEvent({
    required this.myCartItem,
  });

  @override
  List<Object> get props => [
        myCartItem,
      ];
}

class DeleteMyCartItemEvent extends MyCartItemEvent {
  final String myCartItemURL;

  const DeleteMyCartItemEvent({
    required this.myCartItemURL,
  });

  @override
  List<Object> get props => [
        myCartItemURL,
      ];
}
