part of 'add_delete_favorite_product_bloc.dart';

abstract class AddDeleteFavoriteProductState extends Equatable {
  const AddDeleteFavoriteProductState();

  @override
  List<Object> get props => [];
}

class InitialAddDeleteFavoriteProductState
    extends AddDeleteFavoriteProductState {}

class LoadingAddDeleteFavoriteProductState
    extends AddDeleteFavoriteProductState {}

class ErrorAddDeleteFavoriteProductState extends AddDeleteFavoriteProductState {
  final String message;

  const ErrorAddDeleteFavoriteProductState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}

class MessageAddDeleteFavoriteProductState
    extends AddDeleteFavoriteProductState {
  final String message;

  const MessageAddDeleteFavoriteProductState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
