import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Models/base_usecase.dart';

import '../Entities/product.dart';
import '../Repository/base_product_repository.dart';

class SearchProductsByNameUseCase
    extends BaseUseCase<List<Product>, SearchProductsByNameParameters> {
  final BaseProductRepository baseProductRepository;

  SearchProductsByNameUseCase(this.baseProductRepository);

  @override
  Future<Either<Failure, List<Product>>> call(
      SearchProductsByNameParameters parameters) async {
    return await baseProductRepository.searchProductsByName(
      searchProductsParameters: parameters,
    );
  }
}

class SearchProductsByNameParameters extends Equatable {
  final String searchName;

  const SearchProductsByNameParameters({required this.searchName});

  @override
  List<Object> get props => [
        searchName,
      ];
}
