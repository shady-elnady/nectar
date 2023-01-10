import 'dart:convert';

class Category {
  Category({
    this.url,
    required this.name,
    this.image,
    this.slug,
    this.categoryParent,
  });

  final String? url;
  final String name;
  final String? image;
  final String? slug;
  final Category? categoryParent;

  Category copyWith({
    String? url,
    String? name,
    String? image,
    String? slug,
    Category? categoryParent,
  }) =>
      Category(
        url: url ?? this.url,
        name: name ?? this.name,
        image: image ?? this.image,
        slug: slug ?? this.slug,
        categoryParent: categoryParent ?? this.categoryParent,
      );

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        url: json["url"],
        name: json["name"],
        image: json["image"],
        slug: json["slug"],
        categoryParent: json["category_parent"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "name": name,
        "image": image,
        "slug": slug,
        "category_parent": categoryParent,
      };
}
