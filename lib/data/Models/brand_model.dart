import 'dart:convert';

class Brand {
  Brand({
    required this.name,
  });

  final String name;

  factory Brand.fromJson(String str) => Brand.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Brand.fromMap(Map<String, dynamic> json) => Brand(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
