import 'dart:convert';

class User {
  User({
    this.url,
    required this.username,
    required this.email,
    this.password,
    this.isActive,
    this.isStaff,
    this.isSuperuser,
    this.slug,
  });

  final String? url;
  final String username;
  final String email;
  final String? password;
  final bool? isActive;
  final bool? isStaff;
  final bool? isSuperuser;
  final String? slug;

  User copyWith({
    String? url,
    String? username,
    String? email,
    String? password,
    bool? isActive,
    bool? isStaff,
    bool? isSuperuser,
    String? slug,
  }) =>
      User(
        url: url ?? this.url,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        isActive: isActive ?? this.isActive,
        isStaff: isStaff ?? this.isStaff,
        isSuperuser: isSuperuser ?? this.isSuperuser,
        slug: slug ?? this.slug,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        url: json["url"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        isActive: json["is_active"],
        isStaff: json["is_staff"],
        isSuperuser: json["is_superuser"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "username": username,
        "email": email,
        "password": password,
        "is_active": isActive,
        "is_staff": isStaff,
        "is_superuser": isSuperuser,
        "slug": slug,
      };
}
