part of 'searched_products_bloc.dart';

abstract class SearchedProductEvent extends Equatable {
  final String searchWord;
  const SearchedProductEvent({
    required this.searchWord,
  });

  @override
  List<Object> get props => [
        searchWord,
      ];
}

class RefreshSearchedProductsByNameEvent extends SearchedProductEvent {
  const RefreshSearchedProductsByNameEvent({
    required super.searchWord,
  });
  @override
  List<Object> get props => [
        searchWord,
      ];
}

class GetSearchedProductsByNameEvent extends SearchedProductEvent {
  const GetSearchedProductsByNameEvent({
    required super.searchWord,
  });
  @override
  List<Object> get props => [
        searchWord,
      ];
}

class RefreshSearchedProductsByCategoryEvent extends SearchedProductEvent {
  const RefreshSearchedProductsByCategoryEvent({
    required super.searchWord,
  });
  @override
  List<Object> get props => [
        searchWord,
      ];
}

class GetSearchedProductsByCategoryEvent extends SearchedProductEvent {
  const GetSearchedProductsByCategoryEvent({
    required super.searchWord,
  });
  @override
  List<Object> get props => [
        searchWord,
      ];
}
