part of 'my_basket_item_bloc.dart';

abstract class MyBasketItemState extends Equatable {
  const MyBasketItemState();

  @override
  List<Object> get props => [];
}

class InitialMyBasketItemState extends MyBasketItemState {}

class LoadingMyBasketItemState extends MyBasketItemState {}

// class LoadedMyBasketItemState extends MyBasketItemState {
//   final MyBasketItem myBasketItem;

//   const LoadedMyBasketItemState({
//     required this.myBasketItem,
//   });

//   @override
//   List<Object> get props => [
//         myBasketItem,
//       ];
// }

class ErrorMyBasketItemState extends MyBasketItemState {
  final String message;

  const ErrorMyBasketItemState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}

class MessageMyBasketItemState extends MyBasketItemState {
  final String message;

  const MessageMyBasketItemState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
