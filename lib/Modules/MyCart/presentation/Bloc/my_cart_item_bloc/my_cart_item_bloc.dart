import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';
import '../../../domain/Entities/my_cart_item.dart';
import '../../../domain/UseCases/my_cart_item_use_case/index.dart';

part 'my_cart_item_event.dart';
part 'my_cart_item_state.dart';

class AddDeleteUpdateToCartBloc extends Bloc<MyCartItemEvent, MyCartItemState> {
  final AddMyCartItemUsecase addMyCartItem;
  final UpdateMyCartItemUsecase updateMyCartItem;
  final DeleteMyCartItemUsecase deleteMyCartItem;
  AddDeleteUpdateToCartBloc({
    required this.addMyCartItem,
    required this.updateMyCartItem,
    required this.deleteMyCartItem,
  }) : super(InitialMyCartItemState()) {
    on<MyCartItemEvent>((event, emit) async {
      if (event is AddMyCartItemEvent) {
        emit(LoadingMyCartItemState());

        final failureOrDoneMessage =
            await addMyCartItem(myCartItem: event.myCartItem);

        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            Meassages.addSuccess,
          ),
        );
      } else if (event is UpdateMyCartItemEvent) {
        emit(LoadingMyCartItemState());

        final failureOrDoneMessage =
            await updateMyCartItem(myCartItem: event.myCartItem);

        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            Meassages.updateSuccess,
          ),
        );
      } else if (event is DeleteMyCartItemEvent) {
        emit(LoadingMyCartItemState());

        final failureOrDoneMessage =
            await deleteMyCartItem(myCartItemURL: event.myCartItemURL);

        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            Meassages.deleteSuccess,
          ),
        );
      }
    });
  }

  MyCartItemState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorMyCartItemState(
        message: FailureToMessage.call(
          failure: failure,
        ),
      ),
      (_) => MessageMyCartItemState(
        message: message,
      ),
    );
  }
}
