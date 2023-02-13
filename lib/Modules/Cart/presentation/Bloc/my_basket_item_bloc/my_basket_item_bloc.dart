import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';
import '../../../../Product/domain/Entities/product.dart';
import '../../../domain/Entities/my_basket_item.dart';
import '../../../domain/UseCases/my_basket_items_use_case/index.dart';

part 'my_basket_item_event.dart';
part 'my_basket_item_state.dart';

class AddDeleteUpdateToBasketBloc
    extends Bloc<MyBasketItemEvent, MyBasketItemState> {
  final AddMyBasketItemUsecase addMyBasketItem;
  final UpdateMyBasketItemUsecase updateMyBasketItem;
  final DeleteMyBasketItemUsecase deleteMyBasketItem;
  AddDeleteUpdateToBasketBloc({
    required this.addMyBasketItem,
    required this.updateMyBasketItem,
    required this.deleteMyBasketItem,
  }) : super(InitialMyBasketItemState()) {
    on<MyBasketItemEvent>((event, emit) async {
      if (event is AddMyBasketItemEvent) {
        emit(LoadingMyBasketItemState());

        final failureOrDoneMessage =
            await addMyBasketItem(myBasketItem: event.myBasketItem);

        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            Meassages.addSuccess,
          ),
        );
      } else if (event is UpdateMyBasketItemEvent) {
        emit(LoadingMyBasketItemState());

        final failureOrDoneMessage =
            await updateMyBasketItem(myBasketItem: event.myBasketItem);

        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            Meassages.updateSuccess,
          ),
        );
      } else if (event is DeleteMyBasketItemEvent) {
        emit(LoadingMyBasketItemState());

        final failureOrDoneMessage =
            await deleteMyBasketItem(product: event.product);

        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            Meassages.deleteSuccess,
          ),
        );
      }
    });
  }

  MyBasketItemState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorMyBasketItemState(
        message: FailureToMessage.call(failure),
      ),
      (_) => MessageMyBasketItemState(
        message: message,
      ),
    );
  }
}
