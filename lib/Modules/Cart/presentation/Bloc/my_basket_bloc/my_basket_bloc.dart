import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../../domain/Entities/my_basket.dart';
import '../../../domain/UseCases/my_basket_use_case/get_my_basket.dart';

part 'my_basket_event.dart';
part 'my_basket_state.dart';

class MyBasketBloc extends Bloc<MyBasketEvent, MyBasketState> {
  final GetMyBasketUsecase getMyBasket;
  MyBasketBloc({
    required this.getMyBasket,
  }) : super(InitialMyBasketState()) {
    on<MyBasketEvent>((event, emit) async {
      if (event is GetMyBasketEvent || event is RefreshMyBasketEvent) {
        emit(LoadingMyBasketState());

        final failureOrMyBasket = await getMyBasket();
        emit(_mapFailureOrMyBasketToState(failureOrMyBasket));
      }
    });
  }

  MyBasketState _mapFailureOrMyBasketToState(Either<Failure, MyBasket> either) {
    return either.fold(
      (failure) => ErrorMyBasketState(message: FailureToMessage.call(failure)),
      (myBasket) => LoadedMyBasketState(
        myBasket: myBasket,
      ),
    );
  }
}
