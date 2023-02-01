import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../Product/domain/Entities/product.dart';

class User extends Equatable {
  final String url;
  final String? username;
  final String email;
  final bool? isActive;
  final bool? isVerified;
  final bool? isStaff;
  final bool? isSuperuser;
  final List<Product?> favoritesProducts;
  final String slug;

  const User({
    required this.url,
    this.username,
    required this.email,
    this.isActive,
    this.isVerified,
    this.isStaff,
    this.isSuperuser,
    required this.favoritesProducts,
    required this.slug,
  });

  @override
  String toString() {
    return 'User(url: $url, username: $username, email: $email, isActive: $isActive, isVerified: $isVerified, isStaff: $isStaff, isSuperuser: $isSuperuser, favoritesProducts: $favoritesProducts, slug: $slug)';
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'url': url,
        'username': username,
        'email': email,
        'is_active': isActive,
        'is_verified': isVerified,
        'is_staff': isStaff,
        'is_superuser': isSuperuser,
        'favorites_products': favoritesProducts.map((e) => e!.toMap()).toList(),
        'slug': slug,
      };

  User copyWith({
    required String url,
    required String username,
    required String email,
    bool? isActive,
    bool? isVerified,
    bool? isStaff,
    bool? isSuperuser,
    required List<Product?> favoritesProducts,
    required String slug,
  }) {
    return User(
      url: this.url,
      username: this.username,
      email: this.email,
      isActive: isActive ?? this.isActive,
      isVerified: isVerified ?? this.isVerified,
      isStaff: isStaff ?? this.isStaff,
      isSuperuser: isSuperuser ?? this.isSuperuser,
      favoritesProducts: this.favoritesProducts,
      slug: this.slug,
    );
  }

  @override
  List<Object?> get props => [
        url,
        username,
        email,
        isActive,
        isVerified,
        isStaff,
        isSuperuser,
        favoritesProducts,
        slug,
      ];
}
