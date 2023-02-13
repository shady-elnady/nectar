import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Models/base_usecase.dart';

import '../../../domain/Entities/my_cart.dart';
import '../../../domain/UseCases/my_carts_use_case/get_all_my_carts_usecase.dart';

part 'all_my_carts_event.dart';
part 'all_my_carts_state.dart';

class AllMyCartsBloc extends Bloc<AllMyCartsEvent, AllMyCartsState> {
  final GetAllMyCartUseCase getAllMyCarts;
  AllMyCartsBloc({
    required this.getAllMyCarts,
  }) : super(InitialAllMyCartsState()) {
    on<AllMyCartsEvent>((event, emit) async {
      if (event is GetAllMyCartsEvent) {
        emit(LoadingAllMyCartsState());

        final failureOrPosts =
            await getAllMyCarts(parameters: const NoParameters());
        emit(_mapFailureOrPostsToState(failureOrPosts));
      } else if (event is RefreshAllMyCartsEvent) {
        emit(LoadingAllMyCartsState());

        final failureOrPosts =
            await getAllMyCarts(parameters: const NoParameters());
        emit(_mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }

  AllMyCartsState _mapFailureOrPostsToState(
      Either<Failure, List<MyCart>> either) {
    return either.fold(
      (failure) =>
          ErrorAllMyCartsState(message: FailureToMessage.call(failure)),
      (myCarts) => LoadedAllMyCartsState(
        myCarts: myCarts,
      ),
    );
  }
}
