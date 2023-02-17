part of 'add_delete_favorite_product_bloc.dart';

abstract class AddDeleteFavoriteProductEvent extends Equatable {
  final String productURL;
  const AddDeleteFavoriteProductEvent({
    required this.productURL,
  });
  @override
  List<Object> get props => [
        productURL,
      ];
}

class AddFavoriteProductEvent extends AddDeleteFavoriteProductEvent {
  const AddFavoriteProductEvent({required super.productURL});
}

class DeleteFavoriteProductEvent extends AddDeleteFavoriteProductEvent {
  const DeleteFavoriteProductEvent({required super.productURL});
}
