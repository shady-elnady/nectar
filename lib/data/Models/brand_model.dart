import 'dart:convert';

class Brand {
  Brand({
    required this.name,
    this.image,
  });

  final String name;
  final String? image;

  Brand copyWith({
    String? name,
    String? image,
  }) =>
      Brand(
        name: name ?? this.name,
        image: image ?? this.image,
      );

  factory Brand.fromJson(String str) => Brand.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Brand.fromMap(Map<String, dynamic> json) => Brand(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,
      };
}
