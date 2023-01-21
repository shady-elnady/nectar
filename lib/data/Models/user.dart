// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:collection/collection.dart';

import 'product.dart';

@immutable
class User {
  final String? url;
  final String? username;
  final String email;
  final bool? isActive;
  final bool? isVerified;
  final bool? isStaff;
  final bool? isSuperuser;
  final List<Product>? favoritesProducts;
  final String? slug;

  const User({
    this.url,
    this.username,
    required this.email,
    this.isActive,
    this.isVerified,
    this.isStaff,
    this.isSuperuser,
    this.favoritesProducts,
    this.slug,
  });

  @override
  String toString() {
    return 'User(url: $url, username: $username, email: $email, isActive: $isActive, isVerified: $isVerified, isStaff: $isStaff, isSuperuser: $isSuperuser, favoritesProducts: $favoritesProducts, slug: $slug)';
  }

  factory User.fromMap(Map<String, dynamic> data) => User(
        url: data['url'] as String?,
        username: data['username'] as String?,
        email: data['email'] as String,
        isActive: data['is_active'] as bool?,
        isVerified: data['is_verified'] as bool?,
        isStaff: data['is_staff'] as bool?,
        isSuperuser: data['is_superuser'] as bool?,
        favoritesProducts: (data['favorites_products'] as List<dynamic>?)
            ?.map((e) => Product.fromMap(e as Map<String, dynamic>))
            .toList(),
        slug: data['slug'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'username': username,
        'email': email,
        'is_active': isActive,
        'is_verified': isVerified,
        'is_staff': isStaff,
        'is_superuser': isSuperuser,
        'favorites_products': favoritesProducts?.map((e) => e.toMap()).toList(),
        'slug': slug,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());

  User copyWith({
    String? url,
    String? username,
    required String email,
    bool? isActive,
    bool? isVerified,
    bool? isStaff,
    bool? isSuperuser,
    List<Product>? favoritesProducts,
    String? slug,
  }) {
    return User(
      url: url ?? this.url,
      username: username ?? this.username,
      email: this.email,
      isActive: isActive ?? this.isActive,
      isVerified: isVerified ?? this.isVerified,
      isStaff: isStaff ?? this.isStaff,
      isSuperuser: isSuperuser ?? this.isSuperuser,
      favoritesProducts: favoritesProducts ?? this.favoritesProducts,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! User) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      url.hashCode ^
      username.hashCode ^
      email.hashCode ^
      isActive.hashCode ^
      isVerified.hashCode ^
      isStaff.hashCode ^
      isSuperuser.hashCode ^
      favoritesProducts.hashCode ^
      slug.hashCode;
}
