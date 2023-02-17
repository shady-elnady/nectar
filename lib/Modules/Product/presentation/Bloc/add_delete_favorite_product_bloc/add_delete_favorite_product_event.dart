part of 'add_delete_favorite_product_bloc.dart';

abstract class AddDeleteFavoriteProductEvent extends Equatable {
  const AddDeleteFavoriteProductEvent();
  @override
  List<Object> get props => [];
}

class AddFavoriteProductEvent extends AddDeleteFavoriteProductEvent {
  final String productURL;

  const AddFavoriteProductEvent({
    required this.productURL,
  });
  @override
  List<Object> get props => [
        productURL,
      ];
}

class DeleteFavoriteProductEvent extends AddDeleteFavoriteProductEvent {
  final String favoriteProductURL;
  const DeleteFavoriteProductEvent({required this.favoriteProductURL});
}
