import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Models/base_usecase.dart';
import 'package:nectar_mac/App/Utils/Strings/messages.dart';

import '../../domain/Entities/product.dart';
import '../../domain/UseCases/get_products_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductUseCase getAllProducts;
  ProductBloc({
    required this.getAllProducts,
  }) : super(InitialProductsState()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetProductsEvent) {
        emit(LoadingProductsState());

        final failureOrPosts = await getAllProducts(const NoParameters());
        emit(_mapFailureOrPostsToState(failureOrPosts));
      } else if (event is RefreshProductsEvent) {
        emit(LoadingProductsState());

        final failureOrPosts = await getAllProducts(const NoParameters());
        emit(_mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }

  ProductState _mapFailureOrPostsToState(
      Either<Failure, List<Product>> either) {
    return either.fold(
      (failure) => ErrorProductsState(message: _mapFailureToMessage(failure)),
      (products) => LoadedProductsState(
        products: products,
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
