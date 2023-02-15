part of 'my_cart_item_bloc.dart';

abstract class MyCartItemState extends Equatable {
  const MyCartItemState();

  @override
  List<Object> get props => [];
}

class InitialMyCartItemState extends MyCartItemState {}

class LoadingMyCartItemState extends MyCartItemState {}

// class LoadedMyCartItemState extends MyCartItemState {
//   final MyCartItem myCartItem;

//   const LoadedMyCartItemState({
//     required this.myCartItem,
//   });

//   @override
//   List<Object> get props => [
//         myCartItem,
//       ];
// }

class ErrorMyCartItemState extends MyCartItemState {
  final String message;

  const ErrorMyCartItemState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}

class MessageMyCartItemState extends MyCartItemState {
  final String message;

  const MessageMyCartItemState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
