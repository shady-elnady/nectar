import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';

import '../../../domain/Entities/product.dart';
import '../../../domain/UseCases/favorite_product_use_case/add_favorite_product.dart';
import '../../../domain/UseCases/favorite_product_use_case/delete_favorite_product.dart';

part 'add_delete_favorite_product_event.dart';
part 'add_delete_favorite_product_state.dart';

class AddDeleteUpdateToCartBloc
    extends Bloc<AddDeleteFavoriteProductEvent, AddDeleteFavoriteProductState> {
  final AddFavoriteProductUsecase addFavoriteProduct;
  final DeleteFavoriteProductUsecase deleteFavoriteProduct;
  AddDeleteUpdateToCartBloc({
    required this.addFavoriteProduct,
    required this.deleteFavoriteProduct,
  }) : super(InitialAddDeleteFavoriteProductState()) {
    on<AddDeleteFavoriteProductEvent>((event, emit) async {
      if (event is AddFavoriteProductEvent) {
        emit(LoadingAddDeleteFavoriteProductState());

        final failureOrDoneMessage = await addFavoriteProduct(
          product: event.product,
        );

        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            Meassages.addSuccess,
          ),
        );
      } else if (event is DeleteFavoriteProductEvent) {
        emit(LoadingAddDeleteFavoriteProductState());

        final failureOrDoneMessage = await deleteFavoriteProduct(
          favoriteProductURL: event.favoriteProductURL,
        );

        emit(
          _eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            Meassages.deleteSuccess,
          ),
        );
      }
    });
  }

  AddDeleteFavoriteProductState _eitherDoneMessageOrErrorState(
    Either<Failure, Unit> either,
    String message,
  ) {
    return either.fold(
      (failure) => ErrorAddDeleteFavoriteProductState(
        message: FailureToMessage.call(
          failure: failure,
        ),
      ),
      (_) => MessageAddDeleteFavoriteProductState(
        message: message,
      ),
    );
  }
}
