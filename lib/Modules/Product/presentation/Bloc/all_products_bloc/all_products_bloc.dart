import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Models/base_usecase.dart';

import '../../../domain/Entities/product.dart';
import '../../../domain/UseCases/product_usecase/get_all_products_usecase.dart';

part 'all_products_event.dart';
part 'all_products_state.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  final GetAllProductUseCase getAllProducts;
  AllProductBloc({
    required this.getAllProducts,
  }) : super(InitialAllProductsState()) {
    on<AllProductEvent>((event, emit) async {
      if (event is GetAllProductsEvent) {
        emit(LoadingAllProductsState());

        final failureOrProducts =
            await getAllProducts(parameters: const NoParameters());
        emit(_mapFailureOrProductsToState(failureOrProducts));
      } else if (event is RefreshAllProductsEvent) {
        emit(LoadingAllProductsState());

        final failureOrProducts =
            await getAllProducts(parameters: const NoParameters());
        emit(_mapFailureOrProductsToState(failureOrProducts));
      }
    });
  }

  AllProductState _mapFailureOrProductsToState(
      Either<Failure, List<Product>> either) {
    return either.fold(
      (failure) =>
          ErrorAllProductsState(message: FailureToMessage.call(failure)),
      (products) => LoadedAllProductsState(
        products: products,
      ),
    );
  }
}
