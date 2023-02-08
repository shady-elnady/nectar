// import 'package:dartz/dartz.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:nectar_mac/App/Exceptions/failure.dart';
// import 'package:nectar_mac/App/Models/base_usecase.dart';
// import 'package:nectar_mac/App/Utils/Strings/messages.dart';

// import '../../domain/Entities/brand.dart';
// import '../../domain/UseCases/get_brands_usecase.dart';

// part 'brands_event.dart';
// part 'brands_state.dart';

// class BrandBloc extends Bloc<BrandEvent, BrandState> {
//   final GetAllBrandsUseCase getAllBrands;
//   BrandBloc({
//     required this.getAllBrands,
//   }) : super(InitialBrandsState()) {
//     on<BrandsEvent>((event, emit) async {
//       if (event is GetBrandsEvent) {
//         emit(LoadingBrandsState());

//         final failureOrPosts = await getAllBrands(const NoParameters());
//         emit(_mapFailureOrPostsToState(failureOrPosts));
//       } else if (event is RefreshBrandsEvent) {
//         emit(LoadingBrandsState());

//         final failureOrPosts = await getAllBrands(const NoParameters());
//         emit(_mapFailureOrPostsToState(failureOrPosts));
//       }
//     });
//   }

//   BrandState _mapFailureOrPostsToState(
//       Either<Failure, List<Brand>> either) {
//     return either.fold(
//       (failure) =>
//           ErrorBrandsState(message: _mapFailureToMessage(failure)),
//       (Brands) => LoadedBrandsState(
//         Brands: Brands,
//       ),
//     );
//   }

//   String _mapFailureToMessage(Failure failure) {
//     switch (failure.runtimeType) {
//       case ServerFailure:
//         return Meassages.serverFailure;
//       case EmptyCacheFailure:
//         return Meassages.emptyCacheData;
//       case OfflineFailure:
//         return Meassages.offLineConnection;
//       default:
//         return "Unexpected Error , Please try again later .";
//     }
//   }
// }
