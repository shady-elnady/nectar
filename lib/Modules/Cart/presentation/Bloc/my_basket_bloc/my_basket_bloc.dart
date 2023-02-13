import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../../../Product/domain/Entities/product.dart';
import '../../../domain/Entities/line_in_my_cart.dart';
import '../../../domain/Entities/my_basket.dart';
import '../../../domain/Entities/my_basket_item.dart';

part 'my_basket_event.dart';
part 'my_basket_state.dart';

class AddDeleteUpdateToBasketBloc
    extends Bloc<AddDeleteUpdateToBasketEvent, AddDeleteUpdateToBasketState> {
  final AddToBasketUsecase addToBasket;
  final DeleteToBasketUsecase deleteToBasket;
  final UpdateToBasketUsecase updateToBasket;
  AddDeleteUpdateToBasketBloc(
      {required this.addToBasket,
      required this.deleteToBasket,
      required this.updateToBasket})
      : super(AddDeleteUpdateToBasketInitial()) {
    on<AddDeleteUpdateToBasketEvent>((event, emit) async {
      if (event is AddToBasketEvent) {
        emit(LoadingAddDeleteUpdateToBasketState());

        final failureOrDoneMessage = await addToBasket(event.ToBasket);

        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, ADD_SUCCESS_MESSAGE),
        );
      } else if (event is UpdateToBasketEvent) {
        emit(LoadingAddDeleteUpdateToBasketState());

        final failureOrDoneMessage = await updateToBasket(event.ToBasket);

        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, UPDATE_SUCCESS_MESSAGE),
        );
      } else if (event is DeleteToBasketEvent) {
        emit(LoadingAddDeleteUpdateToBasketState());

        final failureOrDoneMessage = await deleteToBasket(event.ToBasketId);

        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, DELETE_SUCCESS_MESSAGE),
        );
      }
    });
  }

  AddDeleteUpdateToBasketState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorAddDeleteUpdateToBasketState(
        message: FailureToMessage.call(failure),
      ),
      (_) => MessageAddDeleteUpdateToBasketState(message: message),
    );
  }
}
