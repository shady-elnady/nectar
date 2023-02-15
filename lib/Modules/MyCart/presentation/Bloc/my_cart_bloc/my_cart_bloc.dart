import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';

import '../../../domain/Entities/my_cart.dart';
import '../../../domain/UseCases/my_cart_use_case/get_my_cart.dart';

part 'my_cart_event.dart';
part 'my_cart_state.dart';

class MyCartBloc extends Bloc<MyCartEvent, MyCartState> {
  final GetMyCartUsecase getMyCart;
  MyCartBloc({
    required this.getMyCart,
  }) : super(InitialMyCartState()) {
    on<MyCartEvent>((event, emit) async {
      if (event is GetMyCartEvent || event is RefreshMyCartEvent) {
        emit(LoadingMyCartState());

        final failureOrMyCart = await getMyCart();
        emit(_mapFailureOrMyCartToState(failureOrMyCart));
      }
    });
  }

  MyCartState _mapFailureOrMyCartToState(Either<Failure, MyCart> either) {
    return either.fold(
      (failure) => ErrorMyCartState(message: FailureToMessage.call(failure)),
      (myCart) => LoadedMyCartState(
        myCart: myCart,
      ),
    );
  }
}
