import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Models/base_usecase.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';

import '../../domain/Entities/my_cart.dart';
import '../../domain/UseCases/get_my_carts_usecase.dart';

part 'my_cart_event.dart';
part 'my_cart_state.dart';

class MyCartBloc extends Bloc<MyCartEvent, MyCartState> {
  final GetAllMyCartUseCase getAllMyCarts;
  MyCartBloc({
    required this.getAllMyCarts,
  }) : super(InitialMyCartState()) {
    on<MyCartEvent>((event, emit) async {
      if (event is GetMyCartsEvent) {
        emit(LoadingMyCartsState());

        final failureOrPosts = await getAllMyCarts(const NoParameters());
        emit(_mapFailureOrPostsToState(failureOrPosts));
      } else if (event is RefreshMyCartsEvent) {
        emit(LoadingMyCartsState());

        final failureOrPosts = await getAllMyCarts(const NoParameters());
        emit(_mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }

  MyCartState _mapFailureOrPostsToState(Either<Failure, List<MyCart>> either) {
    return either.fold(
      (failure) => ErrorMyCartsState(message: _mapFailureToMessage(failure)),
      (myCarts) => LoadedMyCartsState(
        myCarts: myCarts,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Meassages.serverFailure;
      case EmptyCacheFailure:
        return Meassages.emptyCacheData;
      case OfflineFailure:
        return Meassages.offLineConnection;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
