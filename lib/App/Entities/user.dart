import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String url;
  final String? username;
  final String email;
  final bool? isActive;
  final bool? isVerified;
  final bool? isStaff;
  final bool? isSuperuser;
  final String slug;

  const User({
    required this.url,
    this.username,
    required this.email,
    this.isActive,
    this.isVerified,
    this.isStaff,
    this.isSuperuser,
    required this.slug,
  });

  @override
  String toString() {
    return 'User(url: $url, username: $username, email: $email, isActive: $isActive, isVerified: $isVerified, isStaff: $isStaff, isSuperuser: $isSuperuser, slug: $slug)';
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
        slug,
      ];
}
