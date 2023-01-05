import 'dart:convert';

class Category {
  Category({
    required this.name,
    this.image,
    this.superCategory,
  });

  final String name;
  final String? image;
  final Category? superCategory;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,
      };
}
