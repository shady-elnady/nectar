part of 'add_delete_favorite_product_bloc.dart';

abstract class AddDeleteFavoriteProductEvent extends Equatable {
  const AddDeleteFavoriteProductEvent();
  @override
  List<Object> get props => [];
}

class AddFavoriteProductEvent extends AddDeleteFavoriteProductEvent {
  final Product product;

  const AddFavoriteProductEvent({
    required this.product,
  });
  @override
  List<Object> get props => [
        product,
      ];
}

class DeleteFavoriteProductEvent extends AddDeleteFavoriteProductEvent {
  final String favoriteProductURL;
  const DeleteFavoriteProductEvent({required this.favoriteProductURL});
}
