import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Models/base_usecase.dart';

import '../../Entities/product.dart';
import '../../Repository/base_product_repository.dart';

class GetSearchedProductsUseCase
    extends BaseUseCase<List<Product>, SearchProductsParameters> {
  final BaseProductRepository baseProductRepository;

  GetSearchedProductsUseCase(this.baseProductRepository);

  @override
  Future<Either<Failure, List<Product>>> call({
    required SearchProductsParameters parameters,
  }) async {
    return await baseProductRepository.getSearchProducts(
      searchProductsParameters: parameters,
    );
  }
}

class SearchProductsParameters extends Equatable {
  final Map<String, dynamic> searchMap;

  const SearchProductsParameters({
    required this.searchMap,
  });

  @override
  List<Object> get props => [
        searchMap,
      ];
}
